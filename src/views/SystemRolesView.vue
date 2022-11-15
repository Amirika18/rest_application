<script setup>
import Label from '../components/Label.vue'
import InputNewSystemRole from '../components/InputNewSystemRole.vue'
import SystemRoleLabel from '../components/SystemRoleLabel.vue'
</script>

<script>
let items = [
  {id: "#000001", name: "Role1"},
  {id: "#000002", name: "Role2"},
  {id: "#000003", name: "Role3"},
  {id: "#000004", name: "Role4"}
];
</script>

<template>
  <div>
    <Label>
      <template #label>
        Роли в системе
      </template>
    </Label>
    <InputNewSystemRole />
    <container>
      <SystemRoleLabel v-for="item in items"
                       :key="item.id">
        <template #role>
          {{ item.name }}
        </template>
        <template #id>
          {{ item.id }}
        </template>
      </SystemRoleLabel>
    </container>
  </div>
</template>

<style scoped>
div {
  margin: 20px;
}
</style>