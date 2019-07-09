/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\")\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\")\n\nfunction Asteroid (pos) {\n    COLOR = \"#A9A9A9\";\n    RADIUS = 10;\n\n    this.radius = RADIUS;\n    this.color = COLOR;\n    this.pos = pos['pos'];\n    this.velocity = Util.randomVec(5);\n    let params = { pos: pos, \n                vel: this.velocity, \n                radius: this.RADIUS, \n                color: this.COLOR\n            };\n    this.obj = new MovingObject(params);\n}\n\nUtil.inherits(Asteroid, MovingObject);\nmodule.exports = Asteroid;\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\")\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\")\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\")\n\nfunction Game (){\n    this.DIM_X = 900;\n    this.DIM_Y = 450;\n    this.NUM_ASTEROIDS = 8;\n    this.asteroids = [];\n    this.addAsteroids(this.NUM_ASTEROIDS);\n}\n\nGame.prototype.addAsteroids = function(n){\n    for (let i = 0; i < n; i++) {\n        let pos = this.randomPos();\n        this.asteroids.push(new Asteroid(pos));\n    }\n}\n\nGame.prototype.randomPos = function(){\n    let x  = this.DIM_X * MATH.random();\n    let y = this.DIM_Y * MATH.random();\n    return [x, y];\n}\n\nGame.prototype.draw = function (ctx) {\n    ctx.clearRect();\n    for (let i = 0; i < this.NUM_ASTEROIDS; i++) {\n        this.asteroids[i].draw(ctx)\n    }\n} \n\nGame.prototype.move = function (ctx) {\n    for (let i = 0; i < this.NUM_ASTEROIDS; i++) {\n        this.asteroids[i].move(ctx)\n    }\n} \n\nmodule.exports = Game\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("console.log(\"Webpack is working!\");\n\nconst MovingObject = __webpack_require__(/*! ./moving_object */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid */ \"./src/asteroid.js\");\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\");\nconst Game = __webpack_require__(/*! ./game */ \"./src/game.js\");\n\nwindow.MovingObject = MovingObject;\nwindow.Asteroid = Asteroid;\nwindow.Game = Game;\n\nwindow.addEventListener('DOMContentLoaded', (event) => {\n    const canvas = document.getElementById('game-canvas');\n    const ctx = canvas.getContext(\"2d\");\n    window.ctx = ctx\n    window.canvas = canvas\n});\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// import { __esModule } from \"../dist/main\";\nconst Util = __webpack_require__(/*! ./util */ \"./src/util.js\")\n\nconst MovingObject = function (obj) {\n    this.pos = obj['pos'];\n    this.vel = obj['vel'];\n    this.radius = obj['radius'];\n    this.color = obj['color'];\n}\n\nMovingObject.prototype.draw = function (ctx) {\n    ctx.fillStyle = this.color;\n    ctx.beginPath();\n    \n    ctx.arc(\n        this.pos[0],\n        this.pos[1],\n        this.radius,\n        0,\n        2 * Math.PI,\n        false\n    );\n    \n    ctx.fill();\n}\n\nMovingObject.prototype.move = function (ctx) {\n    let x = this.pos[0] + this.vel[0];\n    let y = this.pos[1] + this.vel[1];\n    this.pos[0] = x;\n    this.pos[1] = y;\n}\n\nmodule.exports = MovingObject;\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n    inherits(childClass, parentClass) {\n        function Surrogate(){};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n\n    scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n    }\n}\n\nmodule.exports = Util\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });