import time

from machine import Pin
from neopixel import NeoPixel

from lib.colors.color_factory import ColorFactory

class NeoStrip:
    OFF = ColorFactory.get("black")

    def __init__(self, pin, num_pixels, rgbw=False):
        self.__pin = pin
        self.__num_pixels = num_pixels
        pin = Pin(self.__pin, Pin.OUT)

        bpp = 4 if rgbw else 3
        self.__strip = NeoPixel(pin, self.__num_pixels, bpp=bpp)
        self.__rgbw = rgbw

    def clear(self):
        self.fill(self.OFF)

    def fill(self, color):
        self.__strip.fill(color.as_tuple(self.__rgbw))
        self.__strip.write()

    def slow_fill(self, color, delay=0.5):
        self.clear()

        # fill slowly in reverse order
        for i in range(self.__num_pixels-1, -1, -1):
            self.__strip[i] = color.as_tuple(self.__rgbw)
            self.__strip.write()
            time.sleep(delay)

    def random_fill(self):
        for i in range(0,self.__num_pixels):
            color = ColorFactory.random()

            self.__strip[i] = color.as_tuple(self.__rgbw)

        self.__strip.write()

    def set(self, num, color):
        self.__strip[num] = color.as_tuple(self.__rgbw)

    def toggle(self, num, color):
        curr_color = self.__strip[num]
        if curr_color == self.OFF.as_tuple(self.__rgbw):
            self.__strip[num] = color.as_tuple(self.__rgbw)
        else:
            self.__strip[num] = self.OFF.as_tuple(self.__rgbw)

    def invert(self, color=ColorFactory.get("white")):
        for num in range(self.__num_pixels):
            self.toggle(num, color)
        self.update()

    def update(self):
        self.__strip.write()

    def __str__(self):
        return "NeoStrip(pin=%d,px_count=%d/%d)" % (self.__pin, self.__num_pixels, len(self.__strip))
