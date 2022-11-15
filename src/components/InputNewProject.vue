<script setup>
</script>

<template>
  <div class="project">
    <div id="label">проект</div>
    <div class="input">
      <div class="rows">
        <input>
        <input>
        <input>
      </div>
      <input id="description">
    </div>
    <button>Добавить</button>
  </div>
</template>


<style scoped>
.project {
  display: grid;
  grid-template-columns: 1fr 5fr 1fr;
  background: var(--color-gray);
}
button {

}
.rows {
  display: grid;
  grid-template-rows: 1fr 1fr 1fr;
}
.input {
  display: grid;
  grid-template-columns: 1fr 2fr;
}
#description {

}
#label {

}
</style>