<script setup>
</script>

<script>
import urlDb from "../../params.js";

export default {
  methods: {
    addSkill() {
      let name = document.getElementById("skill-input");
      let description = document.getElementById("description-input");
      if (this.check(name.value) && this.check(description.value)) {
        let url = urlDb + "/db_api/skills/";
        fetch(url, {
          method: "post",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify({
            name: name.value,
            description: description.value,
          })
        })
            .then(res=>res.json).then()
        name.value = "";
        description.value = "";
        this.$router.go(0);
      }
    },
    check(string) {
      let digits = /\d/.test(string);
      let short = false;
      if (string.length < 1) short = true;
      return !digits && !short
    }
  }
}
</script>

<template>
  <div class="container">
    <div id="name">Навык</div>
    <form class="form">
      <input type="text" id="skill-input" name="skill-input" required placeholder="Навык">
      <input type="text" id="description-input" name="description-input" required placeholder="Описание">
    </form>
    <button type="submit" @click="addSkill">Добавить</button>
  </div>
</template>


<style scoped>
.container {
  display: grid;
  grid-template-columns: 1fr 4fr 1fr;
  font-size: 24px;
}
.form {
  display: grid;
  grid-template-columns: 1fr 2fr;
  background: var(--color-gray);
  height: 60px;
  padding: 5px;
}
#name {
  border-radius: 30px 0 0 30px;
  margin-right: 10px;
  text-align: center;
  padding: 10px;
  background: var(--color-gray);
}
#skill-input {
  max-width: 200px;
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
  background: var(--color-white);
  border-style: none;
  font-size: 24px;
}
</style>