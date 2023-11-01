import { createRouter, createWebHistory } from "vue-router";

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: "/",
      component: () => import("@/views/HomePage.vue"),
    },
    {
      path: "/articles",
      component: () => import("@/views/ArticlesPage.vue"),
    },
    {
      path: "/article",
      component: () => import("@/views/ArticlePage.vue"),
    },
  ],
});

export default router;

