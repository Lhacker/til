'use strict';

class Test {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  get distance() {
    return Math.sqrt(this.x * this.x + this.y * this.y);
  }

  set coodinary(point) {
    this.x = point.x;
    this.y = point.y;
  }
}

const test = new Test(3, 4);
console.log(test.distance);

test.coodinary = {x: 6, y: 8};
console.log(test.distance);
