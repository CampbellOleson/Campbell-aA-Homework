import { RECEIVE_SINGLE_POKEMON_AND_ITEMS } from "../actions/pokemon_action";
import { merge } from "lodash";

const itemsReducer = (state = {}, action) => {
  switch (action.type) {
    case RECEIVE_SINGLE_POKEMON_AND_ITEMS:
      let items = action.payload.items;
      return merge({}, state, { items: items });
    default:
      return state;
  }
};

export default itemsReducer;
