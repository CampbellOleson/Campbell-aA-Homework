export const selectAllPokemon = ({ entities }) => {
  const keys = Object.keys(entities.pokemon);
  return keys.map(id => {
    return (id = entities.pokemon[id]);
  });
};

export const selectPokemonItem = ({ entities }, itemId) => {
  debugger;
  if (!entities) {
    return null;
  } else {
    return entities.items[itemId];
  }
};
