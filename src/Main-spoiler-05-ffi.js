/* global exports */
"use strict";

var greetInJs = function(target) {
    return (function() {
        console.log(target);
    });
};

var loadResource = function(link) {
    return (function() {
        link.content_type = "overwrite";  // write access
        console.log(link);                // read access
    });
};

var loadResourceAsync = function(link) {
    return function(callback) {
        return (function() {
            callback(3)();
        });
    }
}

// module Main
exports.greetInJs = greetInJs;
exports.loadResource = loadResource;
exports.loadResourceAsync = loadResourceAsync;
