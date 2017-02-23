# BOB'17: Purescript tutorial

This is the material for the BOB'17 Purescript tutorial. The code we
are going to work on will be added soon.


### Get prepared

Before you come to the workshop, please go through the following
steps.  I'll be using Mac OS X for the tutorial, but you should
be able to adapt everything to your setup, as long as it supports
JavaScript hacking. If in doubt, open an issue here.

- Node.js: install from https://nodejs.org/en/  (version 6.9.4 LTS should be fine)
- Purescript: download your pick from https://github.com/purescript/purescript/releases/tag/v0.10.5 and follow README instructions
- Build system / dependency management:

- get this git repo:
```shell
git clone https://github.com/mgmeier/purescript-tutorial-bob2017
cd purescript-tutorial-bob2017
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
