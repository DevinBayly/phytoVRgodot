# Phyto Oracle VR vis project

This repo will change over time to contain the development of the application for debut at UA Wonderhouse at SXSW.

## Understanding TCP clients

The code in this repo is python and godot script at the time of this writing. In order to communicate between programs we will use TCP sockets. Godot fortunately has an implementation of this which can be looked at in [TCP_server.gd](./TCP_server.gd). This server will communicate with clients that are sending images over TCP in a fashion like [client.py](./client.py).

To test this out and gain better understanding of what's going on follow these steps

**starting the server**
* Download/clone this repo
* import the [project.godot](./project.godot) file
* in godot double click the [TCP_Server.tscn](./TCP%20Server.tscn) file from the bottom left asset browser
* then use the `run scene` button that looks like the movie filming "clacker" in the top right

**starting the client**
* on the same system in a terminal run `python3 client.py`

The result is that we generate an image on the client and send it to the server and the server just receives it and saves it to the working directory of the project. 

It should be a good first step to make sure this happens on your system before going further with development.