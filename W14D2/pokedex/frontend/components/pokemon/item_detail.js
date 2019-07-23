import React from "react";

const ItemDetail = props => {
  if (!props.current_item) {
    return null;
  } else {
    return (
      <ul>
        <li>{props.current_item.name}</li>
        <li>Happiness: {props.current_item.happiness}</li>
        <li>Price: ${props.current_item.price}</li>
      </ul>
    );
  }
};

export default ItemDetail;
