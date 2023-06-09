class Color:

    DEFAULT_BRIGHTNESS = 0.50

    def __init__(self, red, green, blue, white=0, **kwargs):
        # number between 0.0 & 1.0
        # E.g. .5 = 50% | .25 = 25%
        self.brightness = kwargs.get('brightness', self.DEFAULT_BRIGHTNESS)

        self.__red = red
        self.__green = green
        self.__blue = blue
        self.__white = white

        self.name = kwargs.get('name', None)

    def as_tuple(self, rgbw=False):
        color_tuple = None
        if rgbw:
            color_tuple = (
                int(self.__red   * self.brightness),
                int(self.__green * self.brightness),
                int(self.__blue  * self.brightness),
                int(self.__white * self.brightness)
            )
        else:
            color_tuple = (
                int(self.__red   * self.brightness),
                int(self.__green * self.brightness),
                int(self.__blue  * self.brightness)
            )

        return color_tuple

    def __eq__(self, value):
        return self.as_tuple(True) == value.as_tuple(True)

    def __str__(self) -> str:
        return "%s%s" % (self.name if self.name else "", str(self.as_tuple()))
