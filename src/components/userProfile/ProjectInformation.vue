<script setup>
import ProjectLabelProfile from './ProjectLabelProfile.vue'
</script>

<script>
let items = [
  {id: "#000001", project_name: "Project1", role: "role1"},
  {id: "#000002", project_name: "Project2", role: "role2"},
  {id: "#000003", project_name: "Project3", role: "role3"},
  {id: "#000003", project_name: "Project3", role: "role3"},
  {id: "#000003", project_name: "Project3", role: "role3"},
  {id: "#000003", project_name: "Project3", role: "role3"}
]
</script>

<template>
  <div class="projects">
    <div class="name" id="name">
      Проекты
    </div>
    <ProjectLabelProfile v-for="item in items" :key="item.id">
      <template #project_name>{{ item.project_name }}</template>
      <template #role>{{ item.role }}</template>
    </ProjectLabelProfile>
  </div>
</template>

<style scoped>
.projects {
  display: grid;
  grid-template-rows: 1fr 1fr;
  min-height: 120px;
  border-radius: 30px;
  border-style: none;
  background: var(--color-gray);
  align-items: center;
  padding: 10px;
}
#name {
  font-weight: bold;
  margin-left: 20px;
  margin-right: 20px;
}
div {
  font-size: 24px;
  color: var(--color-text);
}
</style>