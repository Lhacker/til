'use strict';

var _get = function get(object, property, receiver) { if (object === null) object = Function.prototype; var desc = Object.getOwnPropertyDescriptor(object, property); if (desc === undefined) { var parent = Object.getPrototypeOf(object); if (parent === null) { return undefined; } else { return get(parent, property, receiver); } } else if ("value" in desc) { return desc.value; } else { var getter = desc.get; if (getter === undefined) { return undefined; } return getter.call(receiver); } };

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

var SuperTest = function () {
  function SuperTest(name) {
    _classCallCheck(this, SuperTest);

    this.name = name;
  }

  _createClass(SuperTest, [{
    key: 'sayName',
    value: function sayName() {
      return this.name;
    }
  }]);

  return SuperTest;
}();

var SubTest = function (_SuperTest) {
  _inherits(SubTest, _SuperTest);

  function SubTest(name) {
    _classCallCheck(this, SubTest);

    return _possibleConstructorReturn(this, Object.getPrototypeOf(SubTest).call(this, name));
  }

  // override method


  _createClass(SubTest, [{
    key: 'sayName',
    value: function sayName() {
      return _get(Object.getPrototypeOf(SubTest.prototype), 'sayName', this).call(this) + '!!!';
    }
  }, {
    key: 'sayHello',
    value: function sayHello() {
      console.log('Hello!');
    }
  }]);

  return SubTest;
}(SuperTest);

var test1 = new SuperTest('super');
var test2 = new SubTest('subtest');

console.log(test1.sayName());
console.log(test2.sayName());
test2.sayHello();
