import ErrorNotFound from "~/pages/ErrorNotFound.vue";
import MainLayout from "~/layouts/MainLayout.vue";
import IndexPage from "~/pages/IndexPage.vue";

export default [
  {
    path: "/",
    component: MainLayout,
    children: [
      {
        path: "",
        component: IndexPage,
      },
    ],
  },
  {
    path: "/:catchAll(.*)*",
    component: ErrorNotFound,
  },
];
