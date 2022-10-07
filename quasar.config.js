/* eslint-env node */

/*
 * This file runs in a Node context (it's NOT transpiled by Babel), so use only
 * the ES6 features that are supported by your Node version. https://node.green/
 */

/* eslint func-names: 0 */
/* eslint global-require: 0 */

const { configure } = require("quasar/wrappers");

module.exports = configure(() => ({
  extras: [
    "roboto-font-latin-ext",
    "material-icons",
  ],
  animations: [],
}));
