/* require and init the photos AngularJS app */
//= require photos/app
//= require photos/services
//= require photos/controllers

function keyHandler(e) {
  e = e || window.event;

  if (e.keyCode == '37') {
    $('#link-newer').first().click();
  }
  else if (e.keyCode == '39') {
    $('#link-older').first().click();    
  }
}

document.onkeydown = keyHandler;
