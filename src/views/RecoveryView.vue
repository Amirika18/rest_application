<template>
  <div class="recovery">
    <div class="form">
      <div id="label">Восстановить пароль</div>
      <input id="login" placeholder="Login">
      <button type="submit" id="button" @click="sendData">Сбросить пароль</button>
    </div>
    <label id="hint" style="visibility: hidden;">Сообщение с восстановлением отправлено на вашу почту, указанную при регистрации.</label>
  </div>
</template>

<script>
export default {
  name: "RecoveryView",
  methods: {
    sendData() {
      // check login
      // check is not empty
      document.getElementById("hint").style.visibility = "visible";
    }
  }
}
</script>

<style scoped>
.recovery {
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
#label, #login, #button, #hint{
  margin: 10px 20px;
  font-size: 24px;
}
</style>