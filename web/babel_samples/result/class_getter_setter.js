'use strict';

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var Test = function () {
  function Test(x, y) {
    _classCallCheck(this, Test);

    this.x = x;
    this.y = y;
  }

  _createClass(Test, [{
    key: 'distance',
    get: function get() {
      return Math.sqrt(this.x * this.x + this.y * this.y);
    }
  }, {
    key: 'coodinary',
    set: function set(point) {
      this.x = point.x;
      this.y = point.y;
    }
  }]);

  return Test;
}();

var test = new Test(3, 4);
console.log(test.distance);

test.coodinary = { x: 6, y: 8 };
console.log(test.distance);
