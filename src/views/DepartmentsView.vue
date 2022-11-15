<script setup>
import Label from '../components/Label.vue'
import InputNewDepartment from '../components/InputNewDepartment.vue'
import DepartmentLabel from '../components/DepartmentLabel.vue'
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
        Отделы
      </template>
    </Label>
    <InputNewDepartment />
    <container>
      <DepartmentLabel v-for="item in items"
                 :key="item.id">
        <template #department>
          {{ item.name }}
        </template>
        <template #id>
          {{ item.id }}
        </template>
      </DepartmentLabel>
    </container>
  </div>
</template>

<style scoped>
div {
  margin: 20px;
}
</style>