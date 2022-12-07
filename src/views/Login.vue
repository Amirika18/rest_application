<template>
  <div class="login">
    <div class="form">
      <div id="label">Вход</div>
      <input id="login">
      <input id="password" type="password">
      <button type="submit" id="button" @click="sendData">Войти</button>
    </div>
  </div>
</template>

<script>
import urlDb from '../../params.js';

export default {
  name: "Login",
  data() {
    return {
      password: "",
      login: ""
    }
  },
  methods: {
    sendData() {
      let url = urlDb + '/auth/login';
      const login = document.getElementById("login");
      const password = document.getElementById("password");
      fetch(url, {
        method: "post",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          login: login.value,
          password: password.value
        })
      })
          .then(res => {
            if (res.ok) {
              document.cookie = "user=" + login.value;
              this.$router.push("/users")
            }
            else console.log(res)
          })
    }
  }
}
</script>

<style scoped>
.login {
  font-size: 24px;
  margin: auto;
  padding: 20px;
  height: 400px;

  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
}
.form {
  margin: auto;
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
#label, #login, #password, #button {
  margin: 10px 20px;
  font-size: 24px;
}
</style>