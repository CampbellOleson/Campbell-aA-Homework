import React from "react";
import ItemDetail from "./item_detail";
import { ItemDetailContainer } from "./item_detail_container";
import { Route, Link, NavLink } from "react-router-dom";

class PokemonDetail extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    let id = this.props.match.params.pokemonId;
    this.props.requestSinglePokemon(id);
  }

  componentDidUpdate(prevProps) {
    if (
      prevProps.match.params.pokemonId !== this.props.match.params.pokemonId
    ) {
      let id = this.props.match.params.pokemonId;
      this.props.requestSinglePokemon(id);
    }
  }

  render() {
    if (!this.props.current_pokemon || !this.props.current_pokemon.moves) {
      return null;
    } else {
      return (
        <div>
          <ul>
            <li>{this.props.current_pokemon.name}</li>
            <li>Type: {this.props.current_pokemon.poke_type}</li>
            <li>Attack: {this.props.current_pokemon.attack}</li>
            <li>Defense: {this.props.current_pokemon.defense}</li>
            <li>Moves: {this.props.current_pokemon.moves.join(", ")}</li>
          </ul>

          <Route
            path="/:pokemonId/item/:itemId"
            component={ItemDetailContainer}
          />

          <NavLink to="" />
          <NavLink to="" />
          <NavLink to="" />
        </div>
      );
    }
  }
}

export default PokemonDetail;
