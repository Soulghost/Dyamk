# -*- coding: utf-8 -*-

import socket
import sys


def conn():
    args = sys.argv
    ip = args[1]
    port = int(args[2])
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((ip, port))
    f = open('/opt/Dyamk/dylib/framework_version', 'r')
    number = int(f.readlines()[0])
    if number > 0:
        number -= 1
    msg = "{}".format(number)
    s.send(msg.encode())
    s.close()


if __name__ == '__main__':
    conn()
