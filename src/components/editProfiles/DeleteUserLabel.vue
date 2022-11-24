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
    <div class="button" @click="$emit('delete-user')">
      X
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
.button{
  height: 60px;
  width: 60px;
  margin-left: 10px;
  padding: 10px;
  text-align: center;
  border-radius: 30px;
  background: var(--color-gray);
  color: var(--text-color);
}
.button:hover {
  cursor: pointer;
  background: var(--color-choose);
}
.label:hover {
}
.data {
  display: grid;
  grid-template-columns: 5fr 3fr;
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
}
</style>