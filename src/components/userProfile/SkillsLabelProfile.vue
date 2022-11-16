<script setup>
import SkillBubble from './SkillBubble.vue'
</script>

<template>
  <div id="label_skill">
    <div id="skills">Навыки</div>
    <div class="row">
      <SkillBubble v-for="item in items" :key="item.id">
        <template #skill>{{ item.skill }}</template>
      </SkillBubble>
    </div>
  </div>
</template>

<script>
let items = [
  {id: "#000001", skill: "JS"},
  {id: "#000002", skill: "Коммуникативность"},
  {id: "#000003", skill: "C++"},
  {id: "#000004", skill: "Python"},
  {id: "#000005", skill: "GoLang"},
  {id: "#000006", skill: "JavaScript"},
]
export default {
  name: "SkillLabelProfile"
}
</script>

<style scoped>
#label_skill {
  border-style: none;
  border-radius: 30px;
  background: var(--color-gray);
  display: grid;
  grid-template-rows: auto;
  align-items: center;
  padding: 10px 20px;
}
.row {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
#skills {
  margin-left: 10px;
  font-weight: bold;
  height: 60px;
  padding-top: 10px;
}
</style>