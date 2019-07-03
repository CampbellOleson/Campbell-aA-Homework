let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */

function _makeGrid () {
  let grid = new Array();
  for (let i = 0; i < 8; i++) {
    let row = new Array(8);
    grid.push(row);
  }
  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");
  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  let [x,y] = [pos[0],pos[1]];
  return this.grid[x][y];
};

// const a = new Board
// console.log(a.getPiece([3,4]))

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  if (this.validMoves(color).length > 0) {return true} else {return false}
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos);
  if (!piece) {
    return false;
  }
  return (piece.color === color);
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  let piece = this.getPiece(pos);
  if (piece != undefined) {
    return true;
  }
  return false;
};

// const b = new Board
// console.log(b.isOccupied([3,4]))

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  if (!this.hasMove("white") && !this.hasMove("black")) {return true}
  return false;
}

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  if (pos[0] >= 0 && pos[0] <= 7 && pos[1] >= 0 && pos[1] <= 7) {
      return true;
  }
  return false;
};


// console.log(b.isValidPos([3,9]))

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {

    if (!piecesToFlip) {
      piecesToFlip = []
    } else {
      piecesToFlip.push(pos)
    }

  const nPos = [pos[0] + dir[0], pos[1]+ dir[1]];

      if (((!(board.isValidPos(nPos))) || !(board.isOccupied(nPos)))) {
        return null;
      } else if (board.isMine(nPos,color)) {
        return piecesToFlip.length === 0 ? null : piecesToFlip;
      } else {
       return _positionsToFlip(board, nPos, color, dir, piecesToFlip);
      }
  }
  

// const b = new Board
// console.log(_positionsToFlip(b,[3,4],"w",[0,1],[]))
    

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {

  if (this.validMove(pos,color)) {

    const flippers = [];
    let [x,y] = [pos[0],pos[1]];
    this.grid[x][y] = new Piece(color);
    const dirs = Board.DIRS;

    var posis = []
    for (let i = 0; i < dirs.length; i++) {
      let dir = dirs[i];
      posis.push(_positionsToFlip(this, pos, color, dir));
    }

    for (let i = 0; i < posis.length; i++) {
      let po = posis[i];
      if (po) {flippers.push(this.getPiece(po[0]))}
    }
    

    for (let i = 0; i < flippers.length; i++) {
      let piece = flippers[i];
      piece.flip();
    }

  } else {
    throw TypeError("Invalid Move");
  }
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  this.forEach(row => {
    console.log();
  });
};

const c = new Board
c.print

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  } 
  
  const moves = [];
  const dirs = Board.DIRS;

  for (let i = 0; i < dirs.length; i++) {
    let dir = dirs[i];
    let options = _positionsToFlip(this,pos,color,dir);
    if (options) {moves.push(options)}
  }

  if (moves.length > 0) {return true}

  return false;

};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {

  const valids = [];

  for (let i = 0; i < this.grid.length; i++) {
    for (let j = 0; j < this.grid.length; j++) {
      let pos = [i,j];
      if (this.validMove(pos, color)) {valids.push(pos)}
    }
  }
  return valids;
}

module.exports = Board;
