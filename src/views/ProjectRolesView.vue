<script setup>
import Label from '../components/Label.vue'
import InputNewProjectRole from '../components/InputNewProjectRole.vue'
import ProjectRoleLabel from '../components/ProjectRoleLabel.vue'
</script>

<script>
let items = [
  {id: "#000001", name: "Отдел"},
  {id: "#000002", name: "Отдел2"},
  {id: "#000003", name: "Отдел3"},
  {id: "#000004", name: "Отдел4"}
];
</script>

<template>
  <div>
    <Label>
      <template #label>
        Роли в проектах
      </template>
    </Label>
    <InputNewProjectRole />
    <container>
      <ProjectRoleLabel v-for="item in items"
                       :key="item.id">
        <template #role>
          {{ item.name }}
        </template>
        <template #id>
          {{ item.id }}
        </template>
      </ProjectRoleLabel>
    </container>
  </div>
</template>

<style scoped>
div {
  margin: 20px;
}
</style>