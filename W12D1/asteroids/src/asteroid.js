const MovingObject = require('./moving_object')
const Util = require('./util')

function Asteroid (pos) {
    COLOR = "#A9A9A9";
    RADIUS = 10;

    this.radius = RADIUS;
    this.color = COLOR;
    this.pos = pos['pos'];
    this.velocity = Util.randomVec(5);
    let params = { pos: pos, 
                vel: this.velocity, 
                radius: this.RADIUS, 
                color: this.COLOR
            };
    this.obj = new MovingObject(params);
}

Util.inherits(Asteroid, MovingObject);
module.exports = Asteroid;
