import React from 'react';

class Tile extends React.Component {
  constructor(props) {
    super();
    this.state = {};
    this.tile = props.tile;
    // this.update = props.onClick;
  }

  render() {

    let classes = this.tile.revealed ? 'revealed' : 'hide';
    let text =
      this.tile.revealed ? this.tile.bombed ? '💥' : 'R' : this.tile.flagged ? '🚩' : '◉';
    return (
      <div onClick={this.handleClick.bind(this)()} className={`tile ${classes}`} > {text}</div>
    )
  }

  handleClick() {

  }
}

export default Tile