import { connect } from "react-redux";
import { requestAllPokemon } from "../../actions/pokemon_action";
import PokemonDetail from "./pokemon_detail";

const mapStateToProps = (state, ownProps) => {
  let id = ownProps.match.params.pokemonId;
  return {
    current_pokemon: state.entities.pokemon[id]
  };
};

const mapDispatchToProps = dispatch => {
  return {
    requestSinglePokemon: () => dispatch(requestSinglePokemon())
  };
};

export const PokemonDetailContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
