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
    $('#' + div + '').removeClass("playable")
  },
  changeCellBackgroundForComputer: function(computer_coords){
    $('#' + computer_coords.join("") + '').css("background-image", "url(images/o.png)")
    $('#' + computer_coords.join("") + '').removeClass("playable")
  },
  goodLuck: function(){
    $('.current-player').show()

  },
  displayWinner:function(){
    $('.game-stats-wrapper').html("<h1> THE COMPUTER WINS! </h1>")
  },
  displayTie: function(){
    $('.game-stats-wrapper').html("<h1> IT'S A TIE! </h1>")
  }

}