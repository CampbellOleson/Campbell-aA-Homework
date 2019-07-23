import { connect } from "react-redux";
import requestSinglePokemon from "../../actions/pokemon_action";
import ItemDetail from "./item_detail";

const mapStateToProps = (state, ownProps) => {
  let id = ownProps.match.params.itemId;
  return {
    current_item: state.entities.items[id]
  };
};

export const ItemDetailContainer = connect(mapStateToProps)(ItemDetail);
