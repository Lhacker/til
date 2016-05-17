(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
var jQuery = require("./my.jquery");

var text = jQuery({
  name: "gao",
  age: 18
});

console.log(text);

},{"./my.jquery":2}],2:[function(require,module,exports){
module.exports = jQuery;

// 日本語の文字列をクエリストリングに変換するモジュール
// Japanese-Query-String略してjQuery
function jQuery(obj){
    var keys = Object.keys(obj);
    if(!keys.length) return "";

    return "?" + keys.map(function(key) {
        return encodeURIComponent(key) + "=" + encodeURIComponent(obj[key]);
    }).join("&");
}

},{}]},{},[1]);
