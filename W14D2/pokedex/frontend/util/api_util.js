import { create } from "domain";
import { receiveSinglePokemon } from "../actions/pokemon_action";

export const fetchAllPokemon = () => {
  return $.get("/api/pokemon");
};

// routes => tell this which controller#action to go to
// controller
// jbuilder


export const catchAPokemon = id => {
  return $.get(`/api/pokemon/${id}`);
};

export const createPokemon = pokemon => {
  return $.ajax({
    method: "POST",
    url: "api/pokemon",
    data: { pokemon }
  });
};
