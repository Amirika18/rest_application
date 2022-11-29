<template>
  <div class="input">
    <div class="information">
      <input id="input" name="input">
    </div>
  </div>
</template>

<style scoped>
.input {
  border-radius: 30px;
  border-style: none;
  background: var(--color-gray);
  align-items: center;
  padding: 10px 15px;
}
div {
  font-size: 24px;
  color: var(--color-text);
}
input, textarea{
  margin: 5px 0;
  background: var(--color-white);
  border-style: none;
  font-size: 24px;
  border-radius: 10px;
  padding:5px;
  width: 100%;
  box-sizing: border-box;
}
.information {
  width: 100%;
  box-sizing: border-box;
}
</style>