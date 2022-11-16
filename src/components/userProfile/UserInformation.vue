<template>
  <div class="user">
    <div class="information" id="name">
      <slot name="name"></slot>
    </div>
    <div class="information">
      <slot name="department"></slot>
    </div>
    <div class="information">
      <slot name="position"></slot>
    </div>
  </div>
</template>

<style scoped>
.user {
  display: grid;
  grid-template-rows: 1fr 1fr 1fr;
  height: 180px;
  border-radius: 30px;
  border-style: none;
  background: var(--color-gray);
  align-items: center;
  padding: 10px;
}
.information {
  margin-left: 20px;
  margin-right: 20px;
}
#name {
  font-weight: bold;
}
div {
  font-size: 24px;
  color: var(--color-text);
}
</style>