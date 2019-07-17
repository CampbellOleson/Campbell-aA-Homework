import Tile from "./tile"
import React from 'react';

class Board extends React.Component {
  constructor(props) {
    super();
    this.state = {};
    this.board = props.board;
    this.updateGame = props.onClick.bind(this);
  }

  render() {
    return (
      <div className="board">
        {
          this.board.grid.map((row, index) => (
            <div key={index} className='row'>
              {
                row.map((tile, index) => {
                  // debugger
                  return <Tile key={index} onClick={this.updateGame} tile={tile} />
                })
              }
            </div>
          ))
        }
      </div>
    )
  }
}

export default Board