debugger
function Cat(name,owner) {
    this.name = name;
    this.owner = owner;
}

let batman = new Cat("batman","cameron");
Cat.prototype.cuteStatement = function() {
    return `${this.owner} loves ${this.name}`;
}
// console.log(batman.cuteStatement());
console.log(batman);