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
