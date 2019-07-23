export const fetchAllPokemon = () => {
  return $.get("/api/pokemon");
};

export const catchAPokemon = id => {
  return $.get(`/api/pokemon/${id}`);
};
