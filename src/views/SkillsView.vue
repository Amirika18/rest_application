<script setup>
import Label from '../components/Label.vue'
import InputNewSkill from '../components/InputNewSkill.vue'
import SkillLabel from '../components/SkillLabel.vue'
</script>

<script>
var items = [
  {id: "#000001", description: "Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long " +
        "Long Long Long Long Long ", name: "навык1"},
  {id: "#000002", description: "Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long " +
        "Long Long Long Long Long ", name: "Js"},
  {id: "#000003", description: "Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long Long " +
        "Long Long Long Long Long ", name: "Python"},
  {id: "#000004", description: "Short", name: "Go"}
];

items.forEach(item => {
  if (item.description.length > 50) {
    item.description = item.description.substring(0, 50) + '...';
  }
})
</script>

<template>
  <div>
    <Label>
      <template #label>
        Навыки
      </template>
    </Label>
    <InputNewSkill />
      <container>
        <SkillLabel v-for="item in items"
                   :key="item.id">
          <template #name>
            {{ item.name }}
          </template>
          <template #description>
            {{ item.description }}
          </template>
          <template #id>
            {{ item.id }}
          </template>
        </SkillLabel>
      </container>
  </div>
</template>

<script>
export default {
  name: "SkillsView"
}
</script>

<style scoped>
div {
  margin: 20px;
}
</style>