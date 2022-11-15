import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home'
    },
    {
      path: '/users',
      name: 'users',
      component: () => import('../views/UsersView.vue')
    },
    {
      path: '/skills',
      name: 'skills',
      component: () => import('../views/SkillsView.vue')
    },
    {
      path: '/projects',
      name: 'projects',
      component: () => import('../views/ProjectsView.vue')
    },
    {
      path: '/system_roles',
      name: 'system_roles',
      component: () => import('../views/SystemRolesView.vue')
    },
    {
      path: '/project_roles',
      name: 'project_roles',
      component: () => import('../views/ProjectRolesView.vue')
    },
    {
      path: '/departments',
      name: 'departments',
      component: () => import('../views/DepartmentsView.vue')
    },
    {
      path: '/positions',
      name: 'positions',
      component: () => import('../views/PositionsView.vue')
    }
  ]
})

export default router
