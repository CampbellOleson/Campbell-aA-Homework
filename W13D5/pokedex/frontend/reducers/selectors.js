export const selectAllPokemon = ({ entities }) => {
  const keys = Object.keys(entities.pokemon);
  debugger;
  return keys.map(id => {
    return (id = entities.pokemon[id]);
  });
};
