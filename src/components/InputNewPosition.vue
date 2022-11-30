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
    addPosition() {
      let position = document.getElementById("position-input");
      if (this.check(position.value)) {
        let url = urlDb + "/db_api/positions/";
        if (!this.isActive) {
          fetch(url, {
            method: "post",
            headers: {
              "Content-Type": "application/json"
            },
            body: JSON.stringify({
              name: position.value,
            })
          })
              .then(res=>res.json).then()
          position.value = "";
          this.$router.go(0);
          this.isActive = true;
        }
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
    <div id="name">Должность</div>
    <form class="form">
      <input type="text" id="position-input" name="position-input" required placeholder="Должность">
    </form>
    <button type="submit" @click="addPosition">Добавить</button>
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
  grid-template-columns: 1fr;
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
}
</style>