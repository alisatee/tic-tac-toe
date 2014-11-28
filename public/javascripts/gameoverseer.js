var GameOverseer = function(gameboard){
  this.gameboard = gameboard
}

GameOverseer.prototype = {
  startGame: function(){
    var that = this
    $.ajax({ url: '/start' }).done(function(serverData){ that.gameboard.renderBoard(serverData) })
  }
}