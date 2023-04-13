#!/usr/bin/python
#esse script descobre as portas abertas de um host
import socket,sys

ip = sys.argv[1] 

for porta in range(1,65535):

	meusocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	if meusocket.connect_ex((ip,porta)) == 0:
		print "Porta",porta,"[ABERTA]"
		meusocket.close()

