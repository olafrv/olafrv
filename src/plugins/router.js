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

router.beforeEach((to) => {
  if (to.path.includes('/futbol')) {
    window.location.href = "https://app.olafrv.com" + to.path;
  }
});

export default router;

