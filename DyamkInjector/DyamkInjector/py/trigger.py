# -*- coding: utf-8 -*-

import socket


def conn():
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect(('127.0.0.1', 2224))
    f = open('/opt/Dyamk/dylib/framework_version', 'r')
    number = int(f.readlines()[0])
    if number > 0:
        number -= 1
    msg = "{}".format(number)
    s.send(msg.encode())
    s.close()


if __name__ == '__main__':
    conn()
