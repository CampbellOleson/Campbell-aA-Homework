import React from "react";
import { Provider } from "react-redux";
import { PokemonIndexContainer } from "./pokemon/pokemon_index_container";
import { HashRouter, Route } from "react-router-dom";
import { PokemonDetailContainer } from "./pokemon/pokemon_detail_container";

export const Root = ({ store }) => (
  <Provider store={store}>
    <HashRouter>
      <Route path="/" component={PokemonIndexContainer} />
      <Route path="/:pokemonId" component={PokemonDetailContainer} />
    </HashRouter>
  </Provider>
);
