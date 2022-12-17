import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'login',
      meta: {layout: "login"},
      component: () => import('../views/Login.vue')
    },
    {
      path: '/registration',
      name: 'registration',
      meta: {layout: "registration"},
      component: () => import('../views/Registration.vue')
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
      path: '/view_user/:id',
      name: 'view_user',
      replace: true,
      component: () => import('../views/ViewUserProfileView.vue')
    },
    {
      path: '/view_skill/:id',
      name: 'view_skill',
      replace: true,
      component: () => import('../views/ViewSkillProfileView.vue')
    },
    {
      path: '/view_project/:id',
      name: 'view_project',
      replace: true,
      component: () => import('../views/ViewProjectProfileView.vue')
    },
    {
      path: '/view_system_role/:id',
      name: 'view_system_role',
      replace: true,
      component: () => import('../views/ViewSystemRoleProfileView.vue')
    },
    {
      path: '/view_project_role/:id',
      name: 'view_project_role',
      replace: true,
      component: () => import('../views/ViewProjectRoleProfileView.vue')
    },
    {
      path: '/view_position/:id',
      name: 'view_position',
      replace: true,
      component: () => import('../views/ViewPositionProfileView.vue')
    },
    {
      path: '/view_department/:id',
      name: 'view_department',
      replace: true,
      component: () => import('../views/ViewDepartmentProfileView.vue')
    },
    {
      path: '/edit_user/:id',
      name: 'edit_user',
      replace: true,
      component: () => import('../views/EditUserProfileView.vue')
    },
    {
      path: '/edit_skill/:id',
      name: 'edit_skill',
      replace: true,
      component: () => import('../views/EditSkillProfileView.vue')
    },
    {
      path: '/edit_project/:id',
      name: 'edit_project',
      replace: true,
      component: () => import('../views/EditProjectProfileView.vue')
    },
    {
      path: '/edit_system_role/:id',
      name: 'edit_system_role',
      replace: true,
      component: () => import('../views/EditSystemRoleView.vue')
    },
    {
      path: '/edit_position/:id',
      name: 'edit_position',
      replace: true,
      component: () => import('../views/EditPositionView.vue')
    },
    {
      path: '/edit_department/:id',
      name: 'edit_department',
      replace: true,
      component: () => import('../views/EditDepartmentView.vue')
    },
    {
      path: '/edit_project_role/:id',
      name: 'edit_project_role',
      replace: true,
      component: () => import('../views/EditProjectRoleView.vue')
    },
    {
      path: '/recovery',
      name: 'recovery_form',
      replace: true,
      meta: {layout: "recovery"},
      component: () => import('../views/RecoveryView.vue')
    },
    {
      path: '/recovery/:id/:tag',
      name: 'recovery_password',
      replace: true,
      meta: {layout: "change"},
      component: () => import('../views/ChangePassword.vue')
    },
    {
      path: '/change_password',
      name: 'change_password',
      replace: true,
      meta: {layout: "change"},
      component: () => import('../views/ChangePassword.vue')
    }
  ]
})

export default router
