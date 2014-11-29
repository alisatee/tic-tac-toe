var GameOverseer = function(board){
  this.board = new GameBoard(board);
  this.movesMade = [];
}


GameOverseer.prototype = {
  startGame: function(){
    var that = this
    $('.who-starts-wrapper').show() 
    $('.human-starts').click(function(){that.startHuman()})
    $('.computer-starts').click(function(){that.startComputer()})
  },
  startHuman: function(){
    var that = this
    $('.who-starts-wrapper').hide()
    this.bindBoardClickEvents();
    this.board.promptTurn()
  },
  startComputer: function(){
    $('.who-starts-wrapper').hide()
    $.ajax({ url: '/start '}).done(this.processComputerMove.bind(this))
    this.bindBoardClickEvents();
    this.board.promptTurn()
  },
  bindBoardClickEvents: function(){
    var that = this
    this.board.grid.on("click", "div", function(){that.processHumanMove(this)})
  },
  processComputerMove: function(serverData){
    var data = JSON.parse(serverData)
    var computer_move = data.move_made
    this.movesMade.push(["player2", computer_move])
    this.board.changeCellBackgroundForComputer(computer_move)
    this.board.promptTurn()
  },
  processHumanMove: function(div_clicked){
    this.board.disableBoardClick();
    this.movesMade.push(["player1", div_clicked.id.split("").map(Number)])
    this.board.changeCellBackgroundForHuman(div_clicked.id)
    this.bindBoardClickEvents()
    this.getComputerMove()
  },
  getComputerMove: function(){
    console.log(this.movesMade)
    $.ajax({
      url: 'play',
      type: 'post',
      datatype: 'json',
      data: {moves_made: JSON.stringify(this.movesMade)}
    }).done(this.processComputerMove.bind(this))
  }
}


$(document).ready(function(){ 
  $('.start').click(function(){
    new GameOverseer("gameboard").startGame()
    $('.start').hide()
  })

})