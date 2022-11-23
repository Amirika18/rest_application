<template>
  <div class="bubble">
    <slot name="skill"></slot>
    <div class="delete" @click="$emit('delete-skill')">X</div>
  </div>
</template>

<script>
export default {
  methods: {},
  name: "SkillBubble"
}
</script>

<style scoped>
.bubble {
  padding: 5px 10px;
  border-radius: 20px;
  border-style: none;
  background: var(--color-choose);
  margin: 5px 5px;
  display: flex;
  flex-direction: row;
}
.delete{
  height: 40px;
  width: 40px;
  border-radius: 20px;
  border-style: none;;
  background: var(--color-gray);
  color: var(--color-white);
  font-size: 24px;
  text-align: center;
  margin-left: 10px;
}
.delete:hover {
  cursor: pointer;
}
</style>