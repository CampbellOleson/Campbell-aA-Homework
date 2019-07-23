import React from "react";
import { withRouter } from "react-router-dom";

class PokemonForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "",
      image_url: "",
      poke_type: "",
      attack: 0,
      defense: 0,
      moves: []
    };

    this.update = this.update.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleSubmit(event) {
    event.preventDefault();

    this.props.createPokemon(this.state);
    //   .then(newPokemon => {
    //   this.props.history.push(`/${newPokemon.id}`);
    // });

    this.setState({
      name: "",
      image_url: "",
      poke_type: "",
      attack: 0,
      defense: 0,
      moves: []
    });
  }

  update(field) {
    return e => this.setState({ [field]: e.target.value });
  }

  updateMoves() {
    return e => this.state.moves.push(e.target.value);
  }

  render() {
    return (
      <form onSubmit={this.handleSubmit}>
        <input
          type="text"
          id="poke-name"
          onChange={this.update("name")}
          placeholder="Name"
        />

        <input
          type="text"
          id="poke-img"
          onChange={this.update("image_url")}
          value={this.state.image_url}
          placeholder="Image URL"
        />

        <select
          id="poke-type"
          onChange={this.update("poke_type")}
          placeholder="type"
        >
          <option value="fire">fire</option>
          <option value="electric">electric</option>
          <option value="normal">normal</option>
          <option value="ghost">ghost</option>
          <option value="psychic">psychic</option>
          <option value="water">water</option>
          <option value="bug">bug</option>
          <option value="dragon">dragon</option>
          <option value="grass">grass</option>
          <option value="fighting">fighting</option>
          <option value="ice">ice</option>
          <option value="flying">flying</option>
          <option value="poison">poison</option>
          <option value="ground">ground</option>
          <option value="rock">rock</option>
          <option value="steel">steel</option>
        </select>

        <input
          type="number"
          id="poke-attack"
          onChange={this.update("attack")}
          value={this.state.attack}
          placeholder="Attack"
        />

        <input
          type="number"
          id="poke-defense"
          onChange={this.update("defense")}
          value={this.state.defense}
          placeholder="Defense"
        />

        <input
          type="text"
          id="poke-move-1"
          onChange={this.updateMoves()}
          placeholder="move 1"
        />

        <input
          type="text"
          id="poke-move-2"
          onChange={this.updateMoves()}
          placeholder="move 2"
        />

        <button>Create Pokemon!</button>
      </form>
    );
  }
}

export default withRouter(PokemonForm);
