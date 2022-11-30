<template>
  <div class="bubble">
    <slot name="skill"></slot>
  </div>
</template>

<script>
export default {
  name: "SkillBubble"
}
</script>

<style scoped>
.bubble {
  padding: 5px 10px;
  border-radius: 30px;
  border-style: none;
  background: var(--color-choose);
  margin: 5px 5px;
}
</style>