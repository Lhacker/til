'use strict';

class SuperTest {
  constructor(name) {
    this.name = name;
  }

  sayName() {
    return this.name;
  }
}

class SubTest extends SuperTest {
  constructor(name) {
    super(name);
  }

  // override method
  sayName() {
    return super.sayName() + '!!!';
  }

  sayHello() {
    console.log('Hello!');
  }
}

const test1 = new SuperTest('super');
const test2 = new SubTest('subtest');

console.log(test1.sayName());
console.log(test2.sayName());
test2.sayHello();
