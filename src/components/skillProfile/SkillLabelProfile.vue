<template>
  <div class="skill">
    <div class="information" id="name">
      <slot name="name"></slot>
    </div>
    <div class="information" id="description">
      <slot name="description"></slot>
    </div>
  </div>
</template>

<style scoped>
.skill {
  display: grid;
  grid-template-rows: auto;
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
#description {
  margin-top: 10px;
  margin-bottom: 10px;
}
div {
  font-size: 24px;
  color: var(--color-text);
}
</style>