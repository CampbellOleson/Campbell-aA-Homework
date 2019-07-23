import React from "react";
import { Provider } from "react-redux";
import { PokemonIndexContainer } from "./pokemon/pokemon_index_container";
import { HashRouter, Route } from "react-router-dom";
import { PokemonDetailContainer } from "./pokemon/pokemon_detail_container";
import { PokemonFormContainer } from "./pokemon/pokemon_form_container";
import { ItemDetailContainer } from "./pokemon/item_detail_container";

export const Root = ({ store }) => {
  return (
    <Provider store={store}>
      <HashRouter>
        <Route path="/" component={PokemonIndexContainer} />
        <Route path="/:pokemonId" component={PokemonDetailContainer} />
        <Route exact path="/" component={PokemonFormContainer} />
      </HashRouter>
    </Provider>
  );
};
