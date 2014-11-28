var GameOverseer = function(gameboard){
  this.gameboard = gameboard
}

GameOverseer.prototype = {
  startGame: function(){
    $.ajax({ url: '/start' }).done(function(serverData){console.log(JSON.parse(serverData))})
  }
}