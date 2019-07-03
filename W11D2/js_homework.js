Array.prototype.myEach = function (cb) {
    for(let i = 0; i < this.length; i++) {
        cb(this[i]);
    }
};

function pCall (thing) {
    console.log(thing);
};

Array.prototype.myTitleize = function (cb) {
    for(let i = 0; i < this.length; i++) {
        let str = `Mx. ${this[i]} Jingleheimer Schmidt`;
        cb(str);
    }
};

// ["Campbell","Tuscan","Collin"].myTitleize(pCall)

let Elephant = function (name,height,tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
};

Elephant.prototype.trumpet = function () {
    console.log(`${this.name} the elephant goes pphhhHHHRRRRR!!!`)
};

Elephant.prototype.grow = function () {
    this.height = this.height + 12;
};

Elephant.prototype.addTrick = function (trick) {
    this.tricks.push(trick);
};

Elephant.prototype.play = function () {
    let i = Math.floor(Math.random() * (this.tricks.length));
    console.log(`${this.name} is ${this.tricks[i]}`);
};

const ele = new Elephant("elle",124,["dancing in the desert mist"]);


// ele.addTrick("flying")
// ele.play()
