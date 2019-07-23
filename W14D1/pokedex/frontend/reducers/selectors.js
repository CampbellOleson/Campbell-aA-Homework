export const selectAllPokemon = ({ entities }) => {
  const keys = Object.keys(entities.pokemon);
  return keys.map(id => {
    return (id = entities.pokemon[id]);
  });
};