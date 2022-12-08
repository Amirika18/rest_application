<template>
  <div class="registration">
    <div class="form">
      <div id="label">Регистрация</div>
      <input id="login" placeholder="Login">
      <input id="password" type="password" placeholder="Password">
      <input id="password_repeat" type="password" placeholder="Repeat password">
      <input id="email" type="email" placeholder="Email">
      <button type="submit" id="button" @click="sendData">Зарегестрироваться</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "Registration"
}
</script>

<style scoped>
.registration {
  margin-top: 50px;
  font-size: 24px;
  padding: 20px;

  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
}
.form {
  width: max-content;
  border-radius: 30px;
  padding: 20px;
  background: var(--color-gray);

  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
  text-align: center;
}
#label, #login, #password, #button, #email, #password_repeat{
  margin: 10px 20px;
  font-size: 24px;
}
</style>