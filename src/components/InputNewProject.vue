<script setup>
</script>

<template>
  <div class="container">
    <div id="label">проект</div>
    <form class="form">
      <div class="rows">
        <input required placeholder="Имя">
        <input>
        <input>
      </div>
      <input id="description">
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
  max-width: 900px;
}
button {
  width: 150px;
  font-size: 24px;
  color: var(--color-text);
  border-radius: 0 30px 30px 0;
  /*height: 60px;*/
  margin-left: 10px;
  background: var(--color-gray);
  border-style: none;
}
.form {
  max-width: 580px;
  padding: 5px;
  display: grid;
  grid-template-columns: 1fr 2fr;
  background: var(--color-gray);
}
.rows {
  display: grid;
  grid-template-rows: 1fr 1fr 1fr;
}
#description {
  max-width: 370px;

}
#label {
  width: 150px;
  border-radius: 30px 0 0 30px;
  background: var(--color-gray);
  margin-right: 10px;
  text-align: center;

  /*text-align-all: center;*/
  /*align-content: center;*/
  /*vertical-align: center;*/
  /*padding: 10px;*/
  padding-top: 57px;
}
input{
  margin: 5px;
  background: var(--color-white);
  border-style: none;
  font-size: 24px;
  max-width: 180px;
}
</style>