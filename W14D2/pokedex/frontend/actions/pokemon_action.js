export const RECEIVE_ALL_POKEMON = "RECEIVE_ALL_POKEMON";
export const RECEIVE_SINGLE_POKEMON_AND_ITEMS =
  "RECEIVE_SINGLE_POKEMON_AND_ITEMS";
import * as APIUtil from "../util/api_util";

export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
  // pokemon: {pokemon json object}
});

export const receiveSinglePokemon = payload => ({
  type: RECEIVE_SINGLE_POKEMON_AND_ITEMS,
  payload
});

export const requestAllPokemon = () => dispatch =>
  APIUtil.fetchAllPokemon().then(pokemon =>
    dispatch(receiveAllPokemon(pokemon))
  );
// pokemon is jbuilder json response

export const requestSinglePokemon = id => dispatch => 
  APIUtil.catchAPokemon(id).then(pokemon =>
    dispatch(receiveSinglePokemon(pokemon))
  );

export const createPokemon = pokemon => dispatch =>
  APIUtil.createPokemon(pokemon).then(pokemon =>
    dispatch(receiveSinglePokemon(pokemon))
  );

window.createPokemon = createPokemon;
