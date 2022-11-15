<script setup>
</script>

<template>
  <div class="container">
    <div id="label">Проект</div>
    <form class="form">
      <div class="rows">
        <input type="text" id="name-input" name="name-input" required placeholder="Название">
        <input type="date" id="start-date-input" name="start-date-input" required placeholder="Дата начала">
        <input type="date" id="end-date-input" name="end-date-input" placeholder="Дата окончания">
      </div>
      <textarea v-model="description" id="description-input" name="description-input" required placeholder="Описание"></textarea>
    </form>
    <button type="submit">Добавить</button>
  </div>
</template>


<style scoped>
.container {
  display: grid;
  grid-template-columns: 1fr 5fr 1fr;
  font-size: 24px;
  height: 160px;
}
button {
  width: 150px;
  font-size: 24px;
  color: var(--color-text);
  border-radius: 0 30px 30px 0;
  margin-left: 10px;
  background: var(--color-gray);
  border-style: none;
}
.form {
  padding: 5px;
  display: grid;
  grid-template-columns: 1fr 3fr;
  background: var(--color-gray);
}
.rows {
  display: grid;
  grid-template-rows: 1fr 1fr 1fr;
}
#label {
  width: 150px;
  border-radius: 30px 0 0 30px;
  background: var(--color-gray);
  margin-right: 10px;
  text-align: center;
  padding-top: 60px;
}
input, textarea{
  margin: 5px;
  background: var(--color-white);
  border-style: none;
  font-size: 24px;
}
#name-input {
  max-width: 180px;
}
textarea {
  max-height: 140px;
  max-width: 305px;
  min-width: 304px;
  min-height: 140px;
}
</style>