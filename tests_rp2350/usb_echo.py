#!/usr/bin/env python3
"""
Host side of the RP.USB_Device CDC-ACM loopback test.

Waits for the test firmware's serial port to appear, sends a sync byte, then
echoes everything it receives until the device goes away or --timeout expires.
Run it before starting the tests:

    ./usb_echo.py &
"""
import argparse
import glob
import os
import select
import sys
import termios
import time
import tty

SYNC = b"\xa5"
PATTERN = "/dev/serial/by-id/usb-rp2040_hal_USB_Tests_*"


def wait_for_port(deadline):
    while time.monotonic() < deadline:
        ports = glob.glob(PATTERN)
        if ports:
            return ports[0]
        time.sleep(0.05)
    return None


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--timeout", type=float, default=120.0,
                        help="give up after this many seconds (default: %(default)s)")
    args = parser.parse_args()
    deadline = time.monotonic() + args.timeout

    port = wait_for_port(deadline)
    if port is None:
        print("usb_echo: test device did not enumerate", file=sys.stderr)
        return 1

    # udev may still be fixing up permissions when the symlink appears
    while True:
        try:
            fd = os.open(port, os.O_RDWR | os.O_NOCTTY)
            break
        except PermissionError:
            if time.monotonic() >= deadline:
                raise
            time.sleep(0.05)

    total = 0
    try:
        # Raw mode before sync, otherwise the tty echoes and mangles the data
        tty.setraw(fd)
        termios.tcflush(fd, termios.TCIOFLUSH)
        os.write(fd, SYNC)
        print(f"usb_echo: echoing on {port}", file=sys.stderr)

        while time.monotonic() < deadline:
            readable, _, _ = select.select([fd], [], [], 0.1)
            if not readable:
                continue
            data = os.read(fd, 4096)
            if not data:
                break
            total += len(data)
            while data:
                data = data[os.write(fd, data):]
    except OSError:
        pass  # device was reset or unplugged
    finally:
        os.close(fd)

    print(f"usb_echo: echoed {total} bytes", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
