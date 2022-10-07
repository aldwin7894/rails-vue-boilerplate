import { createRouter, createWebHashHistory } from "vue-router";
import routes from "./routes";

export default createRouter({
  routes,
  history: createWebHashHistory(),
  scrollBehavior() {
    document.getElementById("app").scrollIntoView({ behavior: "smooth" });
  },
});
