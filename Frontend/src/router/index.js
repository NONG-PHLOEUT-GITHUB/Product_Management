import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/products',
    name: 'products',
    component: () => import('../views/products/Product.vue'),
  },
  {
    path: '/dashboard',
    name: 'dashboard',
    component: () => import('../views/dashboards/Admin.vue'),
  },
  {
    path: '/gategories',
    name: 'gategory',
    component: () => import('../views/categories/Category.vue'),
  },
  {
    path: '/suppliers',
    name: 'suppliers',
    component: () => import('../views/suppliers/supplier.vue'),
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      component: () => import('../views/layout/Layout.vue'),
      children: routes,
      redirect: { name: 'dashboard' }
    }
  ],
});

export default router
