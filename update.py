#!/usr/bin/env python3

import datetime
import socket

MOONBASE_STANDARD_TIME = datetime.timezone(-datetime.timedelta(hours=8))

def send(mode, cmd, arg):
    with socket.socket(socket.AF_INET, socket.SOCK_DGRAM) as sock:
        sock.sendto('desert-bus/{}/{}:{}'.format(mode, cmd, arg).encode('utf-8'), ('127.0.0.1', 4444))

if __name__ == '__main__':
    send('time', 'set', '{:%s}'.format(datetime.datetime.now(tz=MOONBASE_STANDARD_TIME)))
