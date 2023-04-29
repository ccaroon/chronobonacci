import random
from lib.colors.color import Color

class ColorFactory:
    COLORS = {
        # b&w
        "black":      Color(0,0,0,       name="black"),
        "white":      Color(255,255,255, name="white"),
        "white_rgbw": Color(0,0,0,255,   name="white_rgbw"),

        # rainbow
        "red":    Color(255,0,0,   name="red"),
        "orange": Color(255,128,0, name="orange"),
        "yellow": Color(255,255,0, name="yellow"),
        "green":  Color(0,255,0,   name="green"),
        "blue":   Color(0,0,255,   name="blue"),
        "indigo": Color(75,0,255,  name="indigo"),
        "violet": Color(128,0,255, name="violet"),

        # other
        "cyan":   Color(0,255,128, name="cyan"),
        "purple": Color(255,0,255, name="purple"),
        "pink":   Color(255,1,80,  name="pink")
    }

    SETS = {
        "rgb": (
            COLORS["red"],
            COLORS["green"],
            COLORS["blue"],
            COLORS["black"]
        ),
        "Y+B=G": (
            COLORS["yellow"],
            COLORS["blue"],
            COLORS["green"],
            COLORS["black"]
        )
    }

    @classmethod
    def get(cls, name, brightness=Color.DEFAULT_BRIGHTNESS):

        if name.startswith("0x"):
            color = cls.hex(name, name=name)
        else:
            color = cls.COLORS.get(name)

        if color is None:
            raise ValueError("Unknown Color: '%s'" % name)

        color.brightness = brightness
        return color

    @classmethod
    def random(cls, count=1, brightness=Color.DEFAULT_BRIGHTNESS):
        color_set = []
        for _ in range(count):
            red = random.getrandbits(8)
            green = random.getrandbits(8)
            blue = random.getrandbits(8)

            color_set.append(Color(red, green, blue, brightness=brightness))

        return color_set[0] if len(color_set) == 1 else color_set

    @classmethod
    def get_set(cls, name, brightness=Color.DEFAULT_BRIGHTNESS):
        color_set = cls.SETS.get(name)
        if color_set is None:
            raise ValueError("Unknown Color Set: '%d'" % name)

        for color in color_set:
            color.brightness = brightness

        return color_set

    @classmethod
    def hex(self, hex_str, brightness=Color.DEFAULT_BRIGHTNESS, **kwargs):
        if hex_str.startswith("0x"):
            red = int(hex_str[2:4], 16)
            green = int(hex_str[4:6], 16)
            blue= int(hex_str[6:8], 16)
        else:
            raise ValueError("'%s' does not appear to be a HEX number")

        return Color(red, green, blue, brightness=brightness, **kwargs)
