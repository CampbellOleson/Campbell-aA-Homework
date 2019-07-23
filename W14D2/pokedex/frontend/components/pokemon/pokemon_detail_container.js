import { connect } from "react-redux";
import { requestAllPokemon } from "../../actions/pokemon_action";
import PokemonDetail from "./pokemon_detail";
import ItemDetail from "./item_detail";

const mapStateToProps = (state, ownProps) => {
  let id = ownProps.match.params.pokemonId;
  return {
    current_pokemon: state.entities.pokemon[id]
  };
};

const mapDispatchToProps = dispatch => {
  return {
    requestSinglePokemon: id => dispatch(requestSinglePokemon(id))
  };
};

export const PokemonDetailContainer = connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
