var GameBoard = function(boardselector){
  this.grid = $('.' + boardselector + '');
}

GameBoard.prototype = {
  disableBoardClick: function(){
    this.grid.off();
  },
  makeHumanMove: function(div){

  },
  changeCellBackgroundForHuman: function(div){
    $('#' + div + '').css("background-image", "url(images/hipmunk.png)")

  },
  changeCellBackgroundForComputer: function(computer_coords){
    $('#' + computer_coords.join("") + '').css("background-image", "url(images/o.png)")
  },
  promptTurn: function(){
    $('.current-player').show()
    console.log("WAT UP")
  },
  displayWinner:function(){

  }

}