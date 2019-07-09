const MovingObject = require("./moving_object")
const Asteroid = require("./asteroid")
const Util = require("./util")

function Game (){
    this.DIM_X = 900;
    this.DIM_Y = 450;
    this.NUM_ASTEROIDS = 8;
    this.asteroids = [];
    this.addAsteroids(this.NUM_ASTEROIDS);
}

Game.prototype.addAsteroids = function(n){
    for (let i = 0; i < n; i++) {
        let pos = this.randomPos();
        this.asteroids.push(new Asteroid(pos));
    }
}

Game.prototype.randomPos = function(){
    let x  = this.DIM_X * MATH.random();
    let y = this.DIM_Y * MATH.random();
    return [x, y];
}

Game.prototype.draw = function (ctx) {
    ctx.clearRect();
    for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
        this.asteroids[i].draw(ctx)
    }
} 

Game.prototype.move = function (ctx) {
    for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
        this.asteroids[i].move(ctx)
    }
} 

module.exports = Game