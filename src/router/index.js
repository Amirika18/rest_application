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
      replace: true,
      component: () => import('../views/UsersView.vue')
    },
    {
      path: '/skills',
      name: 'skills',
      replace: true,
      component: () => import('../views/SkillsView.vue')
    },
    {
      path: '/projects',
      name: 'projects',
      replace: true,
      component: () => import('../views/ProjectsView.vue')
    },
    {
      path: '/system_roles',
      name: 'system_roles',
      replace: true,
      component: () => import('../views/SystemRolesView.vue')
    },
    {
      path: '/project_roles',
      name: 'project_roles',
      replace: true,
      component: () => import('../views/ProjectRolesView.vue')
    },
    {
      path: '/departments',
      name: 'departments',
      replace: true,
      component: () => import('../views/DepartmentsView.vue')
    },
    {
      path: '/positions',
      name: 'positions',
      replace: true,
      component: () => import('../views/PositionsView.vue')
    },
    {
      path: '/edit_profile/:id',
      name: 'edit_profile',
      replace: true,
      component: () => import('../views/ViewUserProfileView.vue')
    }
  ]
})

export default router
