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
    this.board.goodLuck()
  },
  startComputer: function(){
    $('.who-starts-wrapper').hide()
    $.ajax({ url: '/start '}).done(this.processComputerMove.bind(this))
    this.board.goodLuck()
  },
  bindBoardClickEvents: function(){
    var that = this
    this.board.grid.on("click", ".playable", function(){that.processHumanMove(this)})
  },
  processComputerMove: function(serverData){
    var data = JSON.parse(serverData)
    console.log(data)
    var computer_move = data.move_made
    if (!data.game_over){
      this.movesMade.push(["player2", computer_move])
      this.board.changeCellBackgroundForComputer(computer_move)
      this.bindBoardClickEvents()
    } else { 
      this.processGameOver(data)
    }
  },
  processGameOver: function(data){
    if (data.move_made == null && data.winner == null) {
        this.board.displayTie()
        }
      else if (data.winner == null && data.move_made !== null){ 
        this.board.changeCellBackgroundForComputer(data.move_made)
        this.board.displayTie()} 
      else{
        this.board.changeCellBackgroundForComputer(data.move_made)
        this.board.displayWinner()
      } 
  },
  processHumanMove: function(div_clicked){
    this.board.disableBoardClick();
    this.movesMade.push(["player1", div_clicked.id.split("").map(Number)])
    this.board.changeCellBackgroundForHuman(div_clicked.id)
    this.getComputerMove()
  },
  getComputerMove: function(){
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