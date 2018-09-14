from sense_hat import SenseHat
from time import sleep

sense = SenseHat()

red = {255, 0, 0}

sense.clear(red)

sleep(5)

sense.clear()