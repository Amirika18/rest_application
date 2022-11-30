<script setup>
</script>

<script>
export default {
}
</script>
<template>
  <div class="grid">
    <div class="label">
      <div class="data">
        <div class="name">
          <slot name="name"></slot>
        </div>
        <div class="role">
          <slot name="role"></slot>
        </div>
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
  width: 100%;
}
.grid {
  display: flex;
  flex-direction: row;
}
.label:hover {
  cursor: pointer;
  background: var(--color-choose);
}
.data {
  display: flex;
  flex-direction: row;
  width: 100%;
}
.name {
  font-size: 24px;
  color: var(--color-text);
  margin-left: 10px;
}
.role {
  font-size: 24px;
  color: var(--color-text-light);
  text-align: right;
  margin-right: 10px;
  position: absolute;
  right: 0;
}
</style>