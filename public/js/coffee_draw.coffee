coffee_draw = (p5) ->

  p5.setup = () ->
    p5.size $(window).width(), $(window).height()
    p5.background 0
    
  p5.draw = () ->
    
    x_off = p5.frameCount * 0.0005
    y_off = x_off + 20
    
    x = p5.noise(x_off) * p5.width
    y = p5.noise(y_off) * p5.height
    
    p5.stroke 255, 0, 0, 15
    p5.point(x, y)
    


class Bean
  constructor: (p5, opts) ->
    @x = opts.x
    @y = opts.y
    
    @x_off = opts.x_off
    @y_off = opts.y_off
    
    @vel = opts.vel || 5
    @accel = opts.accel || -0.001
  
  draw: () ->
    return unless @vel > 0
    
    @x_off += 0.0003
    @y_off += 0.0003
    
    @vel += @accel
    
    @x += p5.noise(@x_off) * @vel
    @y += p5.noise(@y_off) * @vel
    
    p5.stroke 0, 255, 0, 15
    
    p5.point @x, @y



$(document).ready ->
  canvas = document.getElementById "processing"
  processing = new Processing canvas, coffee_draw
  
# 
# function sketchProc(processing) {
#   var P = processing,
#       centerX = P.width / 2, 
#       centerY = P.height / 2,
#       fade_interval = 1500,
#       
#       x_noff = Math.random()*1000,
#       y_noff = Math.random()*1000,
#       noff_increment = 0.0001,
#       
#       seeds = [],
#       max_seeds = 500
#       seed_interval = 5;
#   
#   processing.setup = function() {
#     P.size(
#       $(window).width(), $(window).height()
#     );
#     P.background(0);
#   };
#   
#   function fade () {
#     if (P.frameCount % fade_interval === 0) {
#       P.fill(0,0,0,10);
#       P.rect(0,0,P.width,P.height);
#     }
#   }
#   
#   processing.draw = function() {
#     
#     fade();
#     
#     P.stroke(255,0,0, 10);
#     P.fill(255,255,255);
#     
#     x_noff += noff_increment;
#     y_noff += noff_increment;
#     
#     var x = P.noise(x_noff) * P.width, 
#         y = P.noise(y_noff) * P.height;
#     
#     // P.point(x, y);
#     
#     if (P.frameCount % seed_interval === 0) {
#       seeds.push(new Seed(P, {
#         x: P.mouseX,
#         y: P.mouseY,
#         x_noff: y_noff,
#         y_noff: x_noff
#       }));
#     }
#     
#     _.each(seeds, function(seed, i) {
#       seed.draw();
#     });
#     
#     if (seeds.length > max_seeds) {
#       seeds.shift();
#     }
# 
#   };
#   
#   P.mousePressed = function() {
#     log("P.mouseX: ", P.mouseX);
#   }
#   
# }

# function Seed (P, opts) {
#   if (! (this instanceof arguments.callee)) {
#       return new arguments.callee(arguments);
#   }
#   var self = this,
#       color_variance = 120;
#         
#   
#   function init () {
#     self.x = opts.x;
#     self.y = opts.y;
#     self.x_noff = opts.x_noff;
#     self.y_noff = opts.y_noff;
#     self.vel = opts.vel || 1;
#     self.accel = opts.accel || 0;
#   }
#   
#   self.draw = function () {
#     if (self.vel > 0) {
#       self.last_x = self.x;
#       self.last_y = self.y;
#   
#       self.x_noff +=  0.0001;
#       self.y_noff +=  0.0001;
#   
#       self.x += P.noise(self.x_noff)*self.vel - self.vel/2;
#       self.y += P.noise(self.y_noff)*self.vel - self.vel/2;
#   
#       set_color();
#       
#       P.point(self.x, self.y);
#       
#       self.vel -= self.accel;
#     } else {
#       self.vel = 0;
#     }
#   }
#   
#   function set_color () {
#     var r = P.noise(self.x_noff) * color_variance + (255-color_variance),
#         g = P.noise((self.x_noff + self.y_noff)/2.0) * color_variance + (255-color_variance),
#         b = P.noise(self.y_noff) * color_variance + (255-color_variance),
#         a = 5,
#         sw = 1;
#     
#     P.stroke( r, g, b, a);
#   }
#   
#   init();
#   return self;
# }

# $(document).ready(function() {
# 
#   var canvas = document.getElementById("canvas1");
#   
#   // attaching the sketchProc function to the canvas
#   var processingInstance = new Processing(canvas, sketchProc);
# });