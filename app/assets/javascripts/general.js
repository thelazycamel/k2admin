let setUpEventGlobalListeners = function() {
  let closeAlert = document.getElementsByClassName("close")[0];
  if(closeAlert){
    closeAlert.onclick = function() {
      let alert = document.getElementsByClassName("alert")[0];
      if(alert){
        alert.parentNode.removeChild(alert);
      }
    }
  }
  window.setTimeout(function(){
    let alert = document.getElementsByClassName("alert")[0];
    if(alert) {
      alert.parentNode.removeChild(alert);
    }
  }, 3000);
}

setUpEventGlobalListeners()
