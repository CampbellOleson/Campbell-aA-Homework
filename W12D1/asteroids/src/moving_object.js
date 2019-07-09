// import { __esModule } from "../dist/main";
const Util = require("./util")

const MovingObject = function (obj) {
    this.pos = obj['pos'];
    this.vel = obj['vel'];
    this.radius = obj['radius'];
    this.color = obj['color'];
}

MovingObject.prototype.draw = function (ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();
    
    ctx.arc(
        this.pos[0],
        this.pos[1],
        this.radius,
        0,
        2 * Math.PI,
        false
    );
    
    ctx.fill();
}

MovingObject.prototype.move = function (ctx) {
    let x = this.pos[0] + this.vel[0];
    let y = this.pos[1] + this.vel[1];
    this.pos[0] = x;
    this.pos[1] = y;
}

module.exports = MovingObject;