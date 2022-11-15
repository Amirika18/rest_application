<script setup>
</script>

<template>
  <div class="container">
    <div id="name">ФИО</div>
    <form class="form">
      <input type="text" id="surname-input" name="surname-input" required placeholder="Фамилия">
      <input type="text" id="name-input" name="name-input" required placeholder="Имя">
      <input type="text" id="patronymic-input" name="patronymic-input" required placeholder="Отчество">
    </form>
    <button type="submit">Добавить</button>
  </div>
</template>


<style scoped>
.container {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
}
.form {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  background: var(--color-gray);
  padding: 5px;
}
#name {
  border-radius: 30px 0 0 30px;
  margin-right: 10px;
  text-align: center;
  padding: 10px;
  background: var(--color-gray);
}
button {
  font-size: 24px;
  color: var(--color-text);
  border-radius: 0 30px 30px 0;
  height: 60px;
  margin-left: 10px;
  background: var(--color-gray);
  border-style: none;
}
input[type="text"] {
  margin: 5px;
  background: var(--vt-c-white);
  border-style: none;
  /*font-size: 24px;*/
}
</style>