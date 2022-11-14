<script setup>
import MenuItem from './MenuItem.vue'
import {RouterLink, RouterView} from 'vue-router'
</script>

<template>
  <ul class="list">
    <MenuItem>
      <template #name>
        <RouterLink to="/users">Сотрудники</RouterLink>
      </template>
    </MenuItem>

    <MenuItem>
      <template #name>
        <RouterLink to="/skills">Навыки</RouterLink>
      </template>
    </MenuItem>

    <MenuItem>
      <template #name>
        <RouterLink to="/projects">Проекты</RouterLink>
      </template>
    </MenuItem>

    <MenuItem>
      <template #name>
        <RouterLink to="/system_roles">Роли в системе</RouterLink>
      </template>
    </MenuItem>

    <MenuItem>
      <template #name>
        <RouterLink to="/project_roles">Роли в проектах</RouterLink>
      </template>
    </MenuItem>

    <MenuItem>
      <template #name>
        <RouterLink to="/departments">Отделы</RouterLink>
      </template>
    </MenuItem>

    <MenuItem>
      <template #name>
        <RouterLink to="/positions">Должности</RouterLink>
      </template>
    </MenuItem>
  </ul>
</template>

<style scoped>
.list {
  margin-top: 40px;
  margin-left: 40px;
  max-width: 300px;
}
</style>