<script setup>
</script>

<template>
  <div class="label">
    <div class="data">
      <div class="name">
        <slot name="name"></slot>
      </div>
      <div class="description">
        <slot name="description"></slot>
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
.label:hover {
  cursor: pointer;
  background: var(--color-choose);
}
.data {
  display: grid;
  grid-template-columns: 1fr 6fr 1fr;
}
.name {
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
.description {
  max-height: 40px;
  white-space: nowrap;
}
</style>