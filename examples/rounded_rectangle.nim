# original example on https://cairographics.org/samples/

import cairo
import math

var
  surface = imageSurfaceCreate(FORMAT.argb32, 256, 256)
  ctx = surface.newContext()

# a custom shape that could be wrapped in a function
var
  x         = 25.6        # parameters like ctx.rectangle
  y         = 25.6
  width         = 204.8
  height        = 204.8
  aspect        = 1.0     # aspect ratio
  corner_radius = height / 10.0   # and corner curvature radius
  radius = corner_radius / aspect
  degrees = PI / 180.0

ctx.newSubPath()
ctx.arc(x + width - radius, y + radius, radius, -90 * degrees, 0 * degrees)
ctx.arc(x + width - radius, y + height - radius, radius, 0 * degrees, 90 * degrees)
ctx.arc(x + radius, y + height - radius, radius, 90 * degrees, 180 * degrees)
ctx.arc(x + radius, y + radius, radius, 180 * degrees, 270 * degrees)
ctx.closePath()

ctx.setSource(0.5, 0.5, 1)
ctx.fillPreserve()
ctx.setSource(0.5, 0, 0, 0.5)
ctx.setLineWidth(10.0)
ctx.stroke()

discard surface.writeToPng("examples/rounded_rectangle.png")