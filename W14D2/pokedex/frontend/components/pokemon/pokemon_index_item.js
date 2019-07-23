import React from "react";
import { Link } from "react-router-dom";

const PokemonIndexItem = props => {
  // debugger;
  return (
    <li>
      <Link to={`/${props.id}`}>
        <img className="small-poke-img" src={props.img} />
        {props.name}
      </Link>
    </li>
  );
};

export default PokemonIndexItem;
