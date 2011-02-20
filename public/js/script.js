function ExampleClass (opts) {
  if (! (this instanceof arguments.callee)) {
      return new arguments.callee(arguments);
  }
  var self = this;
  
  function init (opts) {
    
  }

  init(opts);
  return self;
}


$(document).ready(function() {

});