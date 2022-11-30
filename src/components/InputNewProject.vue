<script setup>
</script>

<script>
import urlDb from "../../params.js";

export default {
  data() {
    return {
      isActive: false
    }
  },
  methods: {
    addProject() {
      let name = document.getElementById("name-input");
      let start = document.getElementById("start-date-input");
      let end = document.getElementById("end-date-input");
      let description = document.getElementById("description-input");
      if (this.check(name.value) && this.check(description.value)) {
        let url = urlDb + "/db_api/projects/";
        if (!this.isActive) {
          fetch(url, {
            method: "post",
            headers: {
              "Content-Type": "application/json"
            },
            body: JSON.stringify({
              name: name.value,
              description: description.value,
              start: start.value,
              end: end.value
            })
          })
              .then(res=>res.json).then()
          name.value = "";
          description.value = "";
          start.value = "";
          end.value = "";
          this.$router.go(0);
          this.isActive = true;
        }
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
    <div id="label">Проект</div>
    <form class="form">
      <div class="rows">
        <input type="text" id="name-input" name="name-input" required placeholder="Название">
        <input type="date" id="start-date-input" name="start-date-input" required placeholder="Дата начала">
        <input type="date" id="end-date-input" name="end-date-input" placeholder="Дата окончания">
      </div>
      <textarea v-model="description" id="description-input" name="description-input" required placeholder="Описание"></textarea>
    </form>
    <button type="submit" @click="addProject">Добавить</button>
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
button:hover {
  cursor: pointer;
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
  resize: none;
}
</style>