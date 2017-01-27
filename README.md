# BOB'16: purescript tutorial

This is the material for the BOB'16 purescript tutorial.  The code we
are going to work on will be added soon.


### get prepared

Before you come to the workshop, please go through the following
steps.  I am using debian linux for the demonstration, but you should
be able to adapt everything to you setup, as long as it supports
javascript hacking.  If in doubt, open an issue here.

- install `node` from https://nodejs.org/  (you need version 4.1 or higher)
- install `npm` from https://npmjs.com/  (unless it is contained in your node distribution)
- work around https://github.com/npm/npm/issues/11283:
```shell
npm set progress=false
```
- get this git repo:
```shell
git clone https://github.com/fisx/bob16-psc
cd bob16-psc
```
- make sure that `./node_modules/.bin` is in your path:
```shell
export PATH=$PATH:`pwd`/node_modules/.bin
```
- install dependencies and start the static content server:
```shell
npm install
bower install
node static/server.js
```
- point your browser to where we will be working: http://localhost:8080/

You should see a green page with the text `[nothing happening yet]`.

If you look at the browser console (Ctrl+Shift+i), you will find that
`/bob16.js` can't be loaded yet.  We will build this in the tutorial.

The code we will look at in the tutorial will be made available here
under `./src` (purescript) and `./static` (html, css).  You will need

1. an editor to handle this code,
1. a terminal to run the compiler and receive the compiler errors, and
1. a browser to run the result.

If you run into any trouble, at any time at all now or during the
workshop, please open a github issue.



### survey [optional, partial completion ok]

If you want to help me figure out where to start, please fill out the
following survey and email it to matthias@well-typed.com.

```json
{ "javascript":
  { "lines_of_code_written":
    { "more_than_10": null
    , "more_than_1000": null
    , "author_of_code_that_is_in_production": null
    }
  }
, "haskell":
  { "lines_of_code_written":
    { "more_than_10": null
    , "more_than_1000": null
    , "author_of_code_that_is_in_production": null
    }
  }
, "other_programming_languages": null
, "my_professional_role": null
}
```

example:
```json
{ "javascript":
  { "lines_of_code_written":
    { "more_than_10": false
    , "more_than_1000": true
    , "author_of_code_that_is_in_production": false
    }
  }
, "haskell":
  { "lines_of_code_written":
    { "more_than_10": false
    , "more_than_1000": false
    , "author_of_code_that_is_in_production": false
    }
  }
, "other_programming_languages": ["C", "Java", "Idris"]
, "my_professional_role": ["student", "controller", "developer", "product owner"]
}
```
