class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
  }

  makeMove($square) {
    const pos = $square.data("pos");
    const span = $square.children();
    const $ul = $(".ttt-board");
    this.game.playMove(pos);
    const winner = this.game.winner();
    $square.addClass("selected-square");

    span.text(this.game.board.grid[pos[0]][pos[1]]);
    if (winner) {
      const header = $("<h1></h1>");
      header.text(`you win, ${winner}`);
      this.$el.append(header);
      $ul.filter(function (i){
        return 
      })
    }
    else if (this.game.isOver() && !winner) {
      const header = $("<h1></h1>");
      header.text("everyone is bad");
      this.$el.append(header);
    }
  }

  setupBoard() {
    const $ul = $("<ul></ul>");
    $ul.addClass("ttt-board");
    for (let i1 = 0; i1 < 3; i1++) {
      for (let i2 = 0; i2 < 3; i2++) {
        const $li = $("<li></li>");
        const $span = $("<span></span>");

        $li.addClass("ttt-square");
        $li.data("pos", [i1, i2]);

        $li.append($span);
        $ul.append($li);
      }
    };
    this.$el.append($ul);
  };

  bindEvents() {
    $(".ttt-board").on("click", "li", (e) => {
      if (!this.game.winner()) {
        const $square = $(e.currentTarget);
        this.makeMove($square);
      }
    });
  };

}

module.exports = View;
