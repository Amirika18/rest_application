<script setup>
</script>

<template>
  <div class="label">
    <div class="position">
      <slot name="position"></slot>
    </div>
  </div>
</template>


<style scoped>
.label {
  height: 60px;
  border-radius: 30px;
  border-style: none;
  background: var(--color-gray);
  align-items: center;
  padding: 10px;
}
.position {
  font-size: 24px;
  color: var(--color-text);
  margin-left: 10px;
}
</style>