const View = require("./ttt-view")
const Game = require("./game")

$(() => {
  console.log("DOM loaded!")
  const $container = $(".ttt");
  const game = new Game();
  const view = new View(game, $container);
  // $container.addClass("test-background");
  view.setupBoard();
  view.bindEvents();
});
