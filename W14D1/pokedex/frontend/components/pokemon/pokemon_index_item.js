import React from "react";
import { Link } from "react-router-dom";

const PokemonIndexItem = props => {
  return (
    <li>
      <Link to="/{props.match.params.pokemonId}">
        <img className="small-poke-img" src={props.img} />
        {props.name}
      </Link>
    </li>
  );
};

export default PokemonIndexItem;
