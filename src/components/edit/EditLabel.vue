<template>
  <div class="label">
    <div/>
    <div>
      <slot name="label"></slot>
    </div>
    <div class="icon">
      ✎
    </div>
  </div>
</template>

<style scoped>
.label {
  background: var(--color-header-background);
  color: var(--color-white);
  align-items: center;
  text-align: center;
  padding: 10px;
  height: 60px;
  border-radius: 30px;
  font-size: 24px;
  display: grid;
  grid-template-columns: 1fr 20fr 1fr;
}
.icon {
  font-size: 24px;
  height: 40px;
  width: 40px;
  color: var(--color-black);
  background: var(--color-gray);
  border-style: none;
  border-radius: 20px;
}
.icon:hover {
  cursor: pointer;
}
</style>