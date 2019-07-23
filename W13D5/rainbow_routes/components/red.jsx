import React from "react";
import { Route, Link, NavLink } from "react-router-dom";
import Orange from "./orange";
import Yellow from "./yellow";

class Red extends React.Component {
  render() {
    return (
      <div>
        <h2 className="red" />
        <NavLink to="/red/orange">Add Orange</NavLink>
        <NavLink to="/red/yellow">Add Yellow</NavLink>
        <NavLink exact={true} to="/red">
          Red Only
        </NavLink>

        <Route path="/red/orange" component={Orange} />
        <Route path="/red/yellow" component={Yellow} />
      </div>
    );
  }
}

export default Red;
