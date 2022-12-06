
import numpy as numpy
from PIL import Image
from io import BytesIO
import socket

arr = np.random.random((256,256,3))
col = arr*255
im = Image.fromarray(col.astype("uint8"))

HOST = 'localhost'    # The remote host
PORT = 58887             # The same port as used by the server
data = buf.getvalue()

with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    res = s.connect((HOST, PORT))
    print(res)
    s.sendall(data)
    data = s.recv(1024)
