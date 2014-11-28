var Gameboard = function(board){
  this.board = $('.' + board + '')
  this.bindEvents()
  this.movesMade = []

}

Gameboard.prototype = {
  bindEvents: function(){
    var that = this
    this.board.on("click", "div", function(){that.changeBackgroundAndSendResponse(this)})
  },
  changeBackgroundAndSendResponse: function(div){
    $(div).css("background-image", "url(images/hipmunk.png)")
    this.movesMade.push(["player1", div.id.split("").map(Number)])
    var that = this
    $.ajax({
      url: '/play',
      type: 'post',
      data: {moves_made: JSON.stringify(this.movesMade)}
    }).done(function(serverData){that.renderBoard(serverData)})
  },

  renderBoard: function(serverData){
    console.log(serverData)
    var serverData = JSON.parse(serverData)
    this.game = serverData
    var moveMade = serverData.move_made
    if (moveMade !== null){
      this.movesMade.push(["player2", moveMade])
      $('#' + moveMade.join("") + '').css("background-image", "url(images/o.png)")
    }
  }
}


$(document).ready(function(){ 
  $('.start').click(function(){
    
    new GameOverseer(new Gameboard("gameboard")).startGame()
    
  })

})