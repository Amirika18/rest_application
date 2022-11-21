<script setup>
</script>

<script>
import urlDb from "../../params.js";

export default {
  methods: {
    addUser() {
      let name = document.getElementById("name-input");
      let surname = document.getElementById("surname-input");
      let patronymic = document.getElementById("patronymic-input");
      if (this.check(name.value) && this.check(surname.value) && this.check(patronymic.value)) {
        let url = urlDb + "/db_api/users/";
        fetch(url, {
          method: "post",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify({
            name: name.value,
            surname: surname.value,
            patronymic: patronymic.value
          })
        })
        .then(res=>res.json).then(console.log)
        name.value = "";
        surname.value = "";
        patronymic.value = "";
        this.$router.go(0);
      }
    },
    check(string) {
      let digits = /\d/.test(string);
      let short;
      if (string.length < 2) short = true;
      return !digits && !short
    }
  }
}
</script>

<template>
  <div class="container">
    <div id="label">ФИО</div>
    <form class="form">
      <input type="text" id="surname-input" name="surname-input" required placeholder="Фамилия">
      <input type="text" id="name-input" name="name-input" required placeholder="Имя">
      <input type="text" id="patronymic-input" name="patronymic-input" required placeholder="Отчество">
    </form>
    <button type="submit" @click="addUser()">Добавить</button>
  </div>
</template>


<style scoped>
.container {
  display: grid;
  grid-template-columns: 1fr 3fr 1fr;
  font-size: 24px;
}
.form {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  background: var(--color-gray);
  height: 60px;
  padding: 5px;
}
#label {
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
button:hover {
  cursor: pointer;
  background: var(--color-choose);
}
input[type="text"] {
  margin: 5px;
  background: var(--color-white);
  border-style: none;
  font-size: 24px;
  max-width: 200px;
}
</style>