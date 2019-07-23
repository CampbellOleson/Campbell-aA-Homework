import { connect } from "react-redux";
import { requestAllPokemon } from "../../actions/pokemon_action";
import { selectAllPokemon } from "../../reducers/selectors";
import PokemonIndex from "./pokemon_index";

const mapStateToProps = state => {
  return {
    pokemon: selectAllPokemon(state)
  };
};

const mapDispatchToProps = dispatch => {
  return {
    requestAllPokemon: () => dispatch(requestAllPokemon())
  };
};

export const PokemonIndexContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);
