/* global exports */
"use strict";

var greetInJs = function(target) {
    return (function() {
        console.log(target);
    });
};

var loadResource = function(link) {
    return (function() {
        console.log("loading resource: " + JSON.stringify(link));   // read access
        link.content_type = "overwrite!!!";                         // write access, we're inside an effect!
    });
};

var loadResourceAsync = function(link) {
    return function(callback) {             // our callback is defined in purescript
        return (function() {
            // we load the resource from link, and then call the purescript continuation
            // let's assume the answer is 42
            callback(42)();
        });
    }
}

// module Main
exports.greetInJs = greetInJs;
exports.loadResource = loadResource;
exports.loadResourceAsync = loadResourceAsync;
