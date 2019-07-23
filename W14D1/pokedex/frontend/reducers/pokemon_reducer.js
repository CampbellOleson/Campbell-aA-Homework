import {
  RECEIVE_ALL_POKEMON,
  RECEIVE_SINGLE_POKEMON_AND_ITEMS
} from "../actions/pokemon_action";
import { merge } from "lodash";

const pokemonReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return merge({}, state, action.pokemon);
    case RECEIVE_SINGLE_POKEMON_AND_ITEMS:
      let poke = action.payload.pokemon;
      return merge({}, state, { [poke.id]: poke });
    default:
      return state;
  }
};

export default pokemonReducer;
