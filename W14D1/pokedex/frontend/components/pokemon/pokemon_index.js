import React from "react";
import ReactDOM from "react-dom";
import PokemonIndexItem from "./pokemon_index_item";

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    return (
      <ul className="poke-ul">
        {this.props.pokemon.map((poke, idx) => {
          return (
            <PokemonIndexItem name={poke.name} img={poke.image_url} key={idx} />
          );
        })}
      </ul>
    );
  }
}

export default PokemonIndex;
