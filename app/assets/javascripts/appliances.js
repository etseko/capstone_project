//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/
function changeColor()  {
  var labels = document.getElementsByClassName("label-color");

  for (var i=0; i<labels.length; i++){
    var rate = labels[i].getElementsByTagName("P")[0].innerHTML;
    var color = findColor(rate);
    labels[i].getElementsByTagName("P")[0].style.backgroundColor = color;
  }
}

function findColor(rate){
    switch(rate) {
    case "A":
      color = '#00A151'
      break;
    case "B":
      color = '#00BB14'
      break;
    case "C":
      color = '#99D800'
      break;
    case "D":
      color = '#F6FF43'
      break;
    case "E":
      color = '#FED435'
      break;
    case "F":
      color = '#FF7600'
      break;
    case "G":
      color = '#FF0000'
      break;
    default:
      color = '#00A151'
  }
  return color;
}
document.addEventListener("turbolinks:load", function() {
  changeColor();
})
