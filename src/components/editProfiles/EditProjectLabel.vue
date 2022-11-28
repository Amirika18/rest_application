<template>
  <div class="container">
    <form class="form">
      <div class="rows">
        <textarea id="name-input" required placeholder="Название"></textarea>
        <div class="data">
          <input type="date" id="start-date-input" name="start-date-input" required placeholder="Дата начала">
          <input type="date" id="end-date-input" name="end-date-input" placeholder="Дата окончания">
        </div>
      </div>
      <textarea v-model="description" id="description-input" required placeholder="Описание"></textarea>
    </form>
  </div>
</template>

<script>
export default {
  name: "EditProjectLabel"
}
</script>

<style scoped>
.container {
  font-size: 24px;
}
.form {
  padding: 15px;
  display: grid;
  border-radius: 30px;
  border-style: none;
  grid-template-columns: 1fr 2fr;
  background: var(--color-gray);
}
.rows {
  display: grid;
  grid-template-rows: 2fr 1fr;
}
input, textarea{
  margin: 5px;
  background: var(--color-white);
  border-style: none;
  font-size: 24px;
  width: 98%;
}
input {
  flex-wrap: wrap;
  text-wrap: normal;
}
#description-input {
  margin-left: 10px;
}
textarea {
  resize: none;
}
</style>