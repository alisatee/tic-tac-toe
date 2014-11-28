var Gameboard = function(board){
  this.board = $('.' + board + '')
}

Gameboard.prototype = {
  bindEvents: function(){
    this.board.on("click", "div", function(){$(this).css("background-image", "url(images/hipmunk.png)")})
  }
}


$(document).ready(function(){ 
  $('.start').click(function(){
    new GameOverseer(new Gameboard("gameboard").bindEvents()).startGame()
    
  })

})