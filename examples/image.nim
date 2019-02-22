# original example on https://cairographics.org/samples/

import cairo
import math

var
  surface = imageSurfaceCreate(FORMAT.argb32, 256, 256)
  ctx = surface.newContext()

var
  image = imageSurfaceCreateFromPng("examples/data/romedalen.png")
  w = float image.imageSurfaceGetWidth()
  h = float image.imageSurfaceGetHeight()

ctx.translate(128.0, 128.0)
ctx.rotate(45 * PI/180)
ctx.scale(256.0 / w, 256.0 / h)
ctx.translate(-0.5 * w, -0.5 * h)

ctx.setSourceSurface(image, 0, 0)
ctx.paint()

ctx.stroke()

discard surface.writeToPng("examples/image.png")