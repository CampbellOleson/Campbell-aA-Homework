import * as Minesweeper from "./minesweeper";
import Board from "./board";
import React from 'react';

class Game extends React.Component {
    constructor() {
        super();
        this.state = {
            board: new Minesweeper.Board(9, 10)
        };
        this.updateGame = this.updateGame.bind(this);
    }

    updateGame() {
        this.setState(state, () => {
            console.log('boom');
            console.log(this);
            this.state.revealed = !this.state.revealed;
        })
    }

    render() {
        return <Board board={this.state.board} onClick={this.updateGame} />
    }
}

export default Game;