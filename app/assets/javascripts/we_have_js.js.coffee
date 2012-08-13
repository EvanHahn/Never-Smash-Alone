# Turns this...
# <html class="no-js">
# ...into this:
# <html class="js">

document.documentElement.className = document.documentElement.className.replace(/\bno-js\b/, '') + ' js '
