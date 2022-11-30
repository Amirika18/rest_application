<script setup>
</script>

<template>
  <div class="label">
    <div class="department">
      <slot name="department"></slot>
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
.department {
  font-size: 24px;
  color: var(--color-text);
  margin-left: 10px;
}
</style>