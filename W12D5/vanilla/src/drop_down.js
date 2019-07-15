
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

export const dropDown = { 

  dogLinkCreator() { 
    const doggies = Object.keys(dogs);
    const dogLinks = [];

    for (let i = 0; i < doggies.length; i++) {
      const listItem = document.createElement('li');
      const dog = doggies[i];
      const link = dogs[dog];
      let aTag = document.createElement('a');
      aTag.innerHTML = dog;
      aTag.href = link;
      listItem.appendChild(aTag);
      listItem.className = "dog-link";
      dogLinks.push(listItem);
    }
    return dogLinks;
  },

  attachDogLinks() {

    const dogLinks = dropDown.dogLinkCreator();
    const ul = document.querySelector(".drop-down-dog-list");
    dogLinks.forEach( (link) => {
      ul.appendChild(link);
    });
  },

  HTMLColToA(e) {
    const arr = [];
    for (let i = 0; i < e.length; i++) {
      arr.push(e[i]);
    }
    return arr;
  }
}

dropDown.attachDogLinks();

const liCol = document.getElementsByClassName("dog-link");

const lis = dropDown.HTMLColToA(liCol);
const ul = document.querySelector(".drop-down-dog-list");

const handleEnter = function() {
  lis.forEach( ele => {ele.classList.remove("dog-link")})
}

const handleLeave = function() {
  lis.forEach( ele => {
    ele.classList.add("dog-link")})
}

ul.addEventListener("mouseover", handleEnter);
ul.addEventListener("mouseleave", handleLeave);

window.lis = lis;

