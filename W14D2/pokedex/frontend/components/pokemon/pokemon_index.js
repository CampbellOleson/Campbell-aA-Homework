import React from "react";
import ReactDOM from "react-dom";
import PokemonIndexItem from "./pokemon_index_item";
import { HashRouter, Route, Link, NavLink } from "react-router-dom";
import { PokemonDetailContainer } from "./pokemon_detail_container";
import { PokemonFormContainer } from "./pokemon_form_container";

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    <HashRouter>
      <Route path="/:pokemonId" component={PokemonDetailContainer} />;
      <Route exact path="/" component={PokemonFormContainer} />;
    </HashRouter>;
    return (
      <ul className="poke-ul">
        {this.props.pokemon.map((poke, idx) => {
          return (
            <PokemonIndexItem
              id={poke.id}
              name={poke.name}
              img={poke.image_url}
              key={idx}
            />
          );
        })}
      </ul>
    );
  }
}

export default PokemonIndex;
