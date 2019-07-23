import { createPokemon } from "../../actions/pokemon_action";
import PokemonForm from "./pokemon_form";
import { connect } from "react-redux";

const mapDispatchToProps = dispatch => {
  return {
    createPokemon: pokemon => dispatch(createPokemon(pokemon))
  };
};

const mapStateToProps = state => {
  return {};
};

export const PokemonFormContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonForm);
