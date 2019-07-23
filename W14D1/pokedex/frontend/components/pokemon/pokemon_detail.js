import React from "react";

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    let id = this.props.match.params.pokemonId;
    this.props.requestSinglePokemon(id);
  }

  componentDidUpdate(prevProps) {
    if (prevProps !== this.props) {
      let id = this.props.match.params.pokemonId;
      this.props.requestSinglePokemon(id);
    }
  }

  render() {
    console.log(this.props.current_pokemon);
    return null;
  }
}

export default PokemonDetail;
