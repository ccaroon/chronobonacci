from lib.neo_strip import NeoStrip
from lib.fibonacci import FibonacciClock

strip = NeoStrip(33, 5)
clock = FibonacciClock(strip)
# ------------------------------------------------------------------------------
clock.run()
# ------------------------------------------------------------------------------
