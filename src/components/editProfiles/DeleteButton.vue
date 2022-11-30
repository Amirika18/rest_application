<template>
  <div class="label">
    <slot name="label"></slot>
  </div>
</template>

<style scoped>
.label {
  background: var(--color-gray);
  color: var(--color-text);
  align-items: center;
  text-align: center;
  padding: 10px;
  height: 60px;
  border-radius: 30px;
}
.label:hover {
  cursor: pointer;
}
</style>