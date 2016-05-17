class Test {
  constructor(say) {
    this.greet = say;
  }

  sayHello() {
    console.log(this.greet);
  }
}
const test = new Test('Good morning');
test.sayHello();
