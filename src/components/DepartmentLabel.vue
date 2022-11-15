<script setup>
</script>

<template>
  <div class="label">
    <div class="data">
      <div class="department">
        <slot name="department"></slot>
      </div>
      <div class="id">
        <slot name="id"></slot>
      </div>
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
.data {
  display: grid;
  grid-template-columns: 7fr 1fr;
}
.department {
  font-size: 24px;
  color: var(--color-text);
  margin-left: 10px;
}
.id {
  font-size: 24px;
  color: var(--color-text-light);
  text-align: right;
  margin-right: 10px;
}
</style>