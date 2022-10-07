import { createApp } from "vue";
import { Quasar } from "quasar";

import "quasar/src/css/index.sass";
import "@quasar/extras/roboto-font-latin-ext/roboto-font-latin-ext.css";
import "@quasar/extras/material-icons/material-icons.css";
import "~/stylesheets/application.css.scss";

// A few examples for animations from Animate.css:
// import @quasar/extras/animate/fadeIn.css
// import @quasar/extras/animate/fadeOut.css

import store from "~/stores";
import router from "~/routes";
import App from "./App.vue";

const myApp = createApp(App);

myApp.use(Quasar, {
  plugins: {}, // import Quasar plugins and add here
  /*
  config: {
    brand: {
      // primary: '#e46262',
      // ... or all other brand colors
    },
    notify: {...}, // default set of options for Notify Quasar plugin
    loading: {...}, // default set of options for Loading Quasar plugin
    loadingBar: { ... }, // settings for LoadingBar Quasar plugin
    // ..and many more (check Installation card on each Quasar component/directive/plugin)
  }
  */
}).use(router)
  .use(store);

myApp.mount("#app");
