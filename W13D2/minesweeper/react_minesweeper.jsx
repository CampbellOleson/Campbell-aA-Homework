import React from 'react';
import ReactDOM from 'react-dom';
import Game from "./components/game";

document.addEventListener('DOMContentLoaded', (event) => {
    // debugger
    event.preventDefault();
    const root = document.getElementById("root");
    // console.log('dom loaded');
    ReactDOM.render(<Game />, root);
    // console.log('yay');
});