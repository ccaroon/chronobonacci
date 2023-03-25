from lib.neo_strip import NeoStrip
from lib.fibonacci import FibonacciClock

strip = NeoStrip(15, 5)
clock = FibonacciClock(strip)
# ------------------------------------------------------------------------------
clock.run()
# ------------------------------------------------------------------------------
