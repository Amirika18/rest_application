<script setup>
import Label from '../components/Label.vue'
import InputNewPosition from '../components/InputNewPosition.vue'
import PositionLabel from '../components/PositionLabel.vue'
</script>

<script>
let items = [
  {id: "#000001", name: "Должность"},
  {id: "#000002", name: "Должность"},
  {id: "#000003", name: "Должность"},
  {id: "#000004", name: "Должность"}
];
</script>

<template>
  <div>
    <Label>
      <template #label>
        Должности
      </template>
    </Label>
    <InputNewPosition />
    <container>
      <PositionLabel v-for="item in items"
                        :key="item.id">
        <template #position>
          {{ item.name }}
        </template>
        <template #id>
          {{ item.id }}
        </template>
      </PositionLabel>
    </container>
  </div>
</template>

<style scoped>
div {
  margin: 20px;
}
</style>