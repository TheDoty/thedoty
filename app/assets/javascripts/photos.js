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
