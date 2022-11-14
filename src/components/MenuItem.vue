<template>
  <div class="item">
    <slot name="name"></slot>
  </div>
</template>

<style scoped>
.item {
  align-items: center;
}
@media (min-width: 1024px) {
.item {
  height: 60px;
  display: flex;
}
}
</style>