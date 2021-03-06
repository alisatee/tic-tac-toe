var GameOverseer = function(board){
  this.board = new GameBoard(board);
  this.movesMade = [];
}

GameOverseer.prototype = {
  startGame: function(){
    var that = this;
    $('.start').hide();
    $('.who-starts-wrapper').show();
    $('.human-starts').one("click", function(){that.startHuman()});
    $('.computer-starts').one("click",function(){that.startComputer()});
  },
  startHuman: function(){
    $('.who-starts-wrapper').hide().off();
    this.bindBoardClickEvents();
    this.board.goodLuck();
  },
  startComputer: function(){
    $('.who-starts-wrapper').hide();
    $.ajax({ url: '/start '}).done(this.processComputerMove.bind(this));
    this.board.goodLuck();
  },
  bindBoardClickEvents: function(){
    var that = this;
    this.board.grid.on("click", ".playable", function(){that.processHumanMove(this)});
  },
  processComputerMove: function(serverData){
    var data = JSON.parse(serverData);
    var computer_move = data.move_made;
    if (!data.game_over){
      this.movesMade.push(["player2", computer_move]);
      this.board.changeCellBackgroundForComputer(computer_move);
      this.bindBoardClickEvents();
    } else { 
      this.processGameOver(data); 
    }
  },
  resetGame: function(){
    this.board.reset();
    this.movesMade = [];
    $("*").unbind("click");
    this.startGame();
  },
  processGameOver: function(data){
    if (data.move_made) { this.board.changeCellBackgroundForComputer(data.move_made) }
    data.winner ? this.board.displayWinner() : this.board.displayTie();
    $('.reset').show();
    $('.start-over').one("click", function(){this.resetGame()}.bind(this));
  },
  processHumanMove: function(div_clicked){
    this.board.disableBoardClick();
    this.movesMade.push(["player1", div_clicked.id.split("").map(Number)]);
    this.board.changeCellBackgroundForHuman(div_clicked.id);
    this.getComputerMove();
  },
  getComputerMove: function(){
    $.ajax({
      url: 'play',
      type: 'post',
      datatype: 'json',
      data: {moves_made: JSON.stringify(this.movesMade)}
    }).done(this.processComputerMove.bind(this));
  }
}


$(document).ready(function(){ 
  $('.start').click(function(){
    new GameOverseer("gameboard").startGame();
  });
});