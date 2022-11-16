<template>
  <div class="project">
    <div class="information">
      <div class="name">
        <slot name="name"></slot>
      </div>
      <div class="id">
        <slot name="id"></slot>
      </div>
    </div>
    <div class="information">
      <div class="description">
        <slot name="description"></slot>
      </div>
      <div class="date">
        <slot name="date"></slot>
      </div>
    </div>
  </div>
</template>

<style scoped>
.project {
  display: grid;
  grid-template-rows: 1fr 2fr;
  height: 120px;
  border-radius: 30px;
  border-style: none;
  background: var(--color-gray);
  align-items: center;
  padding: 10px;
}
.project:hover {
  cursor: pointer;
  background: var(--color-choose);
}
.information {
  display: grid;
  grid-template-columns: 6fr 1fr;
}
div {
  font-size: 24px;
  color: var(--color-text);
}
.description {
  white-space: pre-line;
  margin-left: 10px;
  font-size: 16px;
}
.name {
  margin-left: 10px;
}
.date, .id{
  text-align: right;
  font-size: 20px;
  margin-right: 10px;
}
</style>