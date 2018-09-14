from sense_hat import SenseHat
from time import sleep

sense = SenseHat()

green = {0, 255, 0}

sense.clear(green)

sleep(5)

sense.clear()