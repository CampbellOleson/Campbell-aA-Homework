document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });

  const addLi = (e) => {
    e.preventDefault()

    const input = document.getElementsByClassName("favorite-input");
    const inputEl = input[0].value;
    const ul = document.getElementById("sf-places");
    const li = document.createElement("li");
    li.textContent = inputEl; 
    ul.appendChild(li);
  
    document.getElementsByClassName("favorite-input")[0].value = "";
  }

  const placeList = document.querySelector(".list-container form");
  placeList.addEventListener("submit",addLi);

  // adding new photos

  // --- your code here!



});
