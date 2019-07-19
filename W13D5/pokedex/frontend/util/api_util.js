export const fetchAllPokemon = () => {
  return $.get("/api/pokemon");
};
