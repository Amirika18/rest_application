<script setup>
</script>

<template>
  <div class="container">
    <div id="name">Роль</div>
    <form class="form">
      <input type="text" id="role-input" name="role-input" required placeholder="Роль в системе">
    </form>
    <button type="submit">Добавить</button>
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
input[type="text"] {
  margin: 5px;
  background: var(--color-white);
  border-style: none;
  font-size: 24px;
}
</style>