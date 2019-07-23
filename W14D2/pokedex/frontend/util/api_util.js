import { create } from "domain";
import { receiveSinglePokemon } from "../actions/pokemon_action";

export const fetchAllPokemon = () => {
  return $.get("/api/pokemon");
};

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
