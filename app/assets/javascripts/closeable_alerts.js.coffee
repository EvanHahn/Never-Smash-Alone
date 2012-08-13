$.fn.ready ->
  $('.alert.closeable').alert().append('<a class="close" data-dismiss="alert" href="#">&times;</a>')
