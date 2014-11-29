var GameBoard = function(boardselector){
  this.grid = $('.' + boardselector + '');
}

GameBoard.prototype = {
  disableBoardClick: function(){
    this.grid.off();
  },
  changeCellBackgroundForHuman: function(div){
    $('#' + div + '').css("background-image", "url(images/hipmunk.png)").removeClass("playable");
  },
  changeCellBackgroundForComputer: function(computer_coords){
    $('#' + computer_coords.join("") + '').css("background-image", "url(images/o.png)").removeClass("playable");
  },
  goodLuck: function(){
    $('.good-luck').show();
  },
  displayWinner:function(){
    $('.good-luck').hide();
    $('.outcome-wrapper').html("<h2> THE COMPUTER WINS! </h2>");
  },
  displayTie: function(){
    $('.good-luck').hide();
    $('.outcome-wrapper').html("<h2> IT'S A TIE! </h2>");
  },
  reset: function(){
    $(".reset").hide();
    $('.outcome-wrapper').empty();
    $(this.grid).children("div").css("background-image", '').removeClass("playable").addClass("playable");
  }
}