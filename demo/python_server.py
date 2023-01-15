
import numpy as np
from PIL import Image
from io import BytesIO
import socket

def makeimbuf():
    randh= np.random.random()*50+5
    arr = np.random.random((int(randh),25,3))
    col = arr*255
    im = Image.fromarray(col.astype("uint8"))
    buf = BytesIO()
    im.save(buf,format="png")
    data = buf.getvalue()
    return data


HOST = '127.0.0.1'    # The remote host
PORT = 58886             # The same port as used by the server

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    res = s.bind((HOST, PORT))
    print(res)
    s.listen()
    conn, addr = s.accept()
    with conn:
        while True:
            print("waiting for next connect")
            data = makeimbuf()
            mesg = conn.recv(1024)
            print("got connectd",mesg)
            print(f"Connected by {addr}")
            print("data length is",len(data))
            amt =conn.sendall(data)
            print("sent the data",amt,"bytes")
