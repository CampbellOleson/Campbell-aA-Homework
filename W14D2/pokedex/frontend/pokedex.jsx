import React from "react";
import ReactDOM from "react-dom";
import { HashRouter, Route } from "react-router-dom";
import { receiveAllPokemon } from "./actions/pokemon_action";
import { fetchAllPokemon } from "./util/api_util";
import pokemonReducer from "./reducers/pokemon_reducer";
import { configureStore } from "./store/store";
import { requestAllPokemon } from "./actions/pokemon_action";
import { selectAllPokemon } from "./reducers/selectors";
import { Root } from "./components/root";
import { requestSinglePokemon } from "./actions/pokemon_action";

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  const root = document.getElementById("root");
  ReactDOM.render(<Root store={store} />, root);
});

window.requestSinglePokemon = requestSinglePokemon;

// window.receiveAllPokemon = receiveAllPokemon;
// window.fetchAllPokemon = fetchAllPokemon;
// window.pokemonReducer = pokemonReducer;
// window.requestAllPokemon = requestAllPokemon;
// window.selectAllPokemon = selectAllPokemon;
