coffee_draw = (p5) ->
  p5.setup = () ->
    p5.size $(window).width(), $(window).height()
    p5.background 0
    @beans = []
    
  p5.draw = () ->    
    x_off = p5.frameCount * 0.0003
    y_off = x_off + 20
    
    x = p5.noise(x_off) * p5.width
    y = p5.noise(y_off) * p5.height
    
    if p5.frameCount % 8 == 0
      bean = new Bean(p5, {
        x: x
        y: y
        x_off: x_off
        y_off: y_off
      })
      @beans.push(bean)
    
    bean.draw() for bean in @beans

class Bean
  constructor: (@p5, opts) ->
    @x = opts.x
    @y = opts.y
    
    @x_off = opts.x_off
    @y_off = opts.y_off
    
    @vel = opts.vel || 3
    @accel = opts.accel || -0.003
  
  draw: () ->
    return unless @vel > 0
    
    @x_off += 0.0007
    @y_off += 0.0007
    
    @vel += @accel
    
    @x += @p5.noise(@x_off) * @vel - @vel/2
    @y += @p5.noise(@y_off) * @vel - @vel/2
    
    @set_color()
    @p5.point @x, @y
    
    
  set_color: () ->
    @p5.colorMode(@p5.HSB, 360, 100, 100)
    
    h = @p5.noise((@x_off+@y_off)/2)*360
    s = 100
    b = 100
    a = 4
    
    @p5.stroke h, s, b, a

$(document).ready ->
  canvas = document.getElementById "processing"
  processing = new Processing canvas, coffee_draw