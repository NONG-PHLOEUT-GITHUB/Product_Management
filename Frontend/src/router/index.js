import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/products',
    name: 'products',
    component: () => import('../views/products/Product.vue')
  },
  {
    path: '/products/save',
    name: 'products-save',
    component: () => import('../views/products/ProductForm.vue')
  },
  {
    path: '/products/:id/details',
    name: 'products-details',
    component: () => import('../views/products/ProductDetails.vue')
  },
  {
    path: '/users',
    name: 'users',
    component: () => import('@/views/users/User.vue')
  },
  {
    path: '/save/user',
    name: 'users-save',
    component: () => import('@/views/users/UserForm.vue')
  },
  {
    path: '/users/:id/details',
    name: 'users-details',
    component: () => import('@/views/users/UserDetails.vue')
  },
  {
    path: '/users/:id/edit',
    name: 'users-edit',
    component: () => import('@/views/users/UserForm.vue')
  },
  {
    path: '/customers',
    name: 'customers',
    component: () => import('@/views/customers/Customer.vue')
  },
  {
    path: '/dashboard',
    name: 'dashboard',
    component: () => import('../views/dashboards/Dashboard.vue')
  },
  {
    path: '/categories',
    name: 'cagategory',
    component: () => import('../views/categories/Category.vue')
  },
  {
    path: '/categories/create',
    name: 'cagategory-create',
    component: () => import('../views/categories/FormCreate.vue')
  },
  {
    path: '/categories/:id/edit',
    name: 'cagategory-edit',
    component: () => import('../views/categories/FormCreate.vue')
  },
  {
    path: '/categories/:id/details',
    name: 'category-details',
    component: () => import('../views/categories/CategoryDetails.vue')
  },
  {
    path: '/suppliers',
    name: 'suppliers',
    component: () => import('../views/suppliers/Supplier.vue')
  },
  {
    path: '/suppliers/save',
    name: 'suppliers-save',
    component: () => import('../views/suppliers/SupplierForm.vue')
  },
  {
    path: '/supplier/:id/details',
    name: 'suppliers-details',
    component: () => import('../views/suppliers/SupplierDetails.vue')
  },
  {
    path: '/account',
    name: 'account',
    component: () => import('../views/common/Profile.vue')
  },
  {
    path: '/general/settings',
    name: 'settings',
    component: () => import('../views/setting/GeneralSettings.vue')
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: '/',
      component: () => import('../views/layout/Layout.vue'),
      children: routes,
      redirect: { name: 'dashboard' }
    },
    {
      path: '/login',
      name: 'login',
      component: () => import('../views/auth/Login.vue')
    }
  ]
})

export default router
