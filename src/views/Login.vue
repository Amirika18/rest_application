<template>
  <div class="login">
    <div class="form">
      <div id="label">Вход</div>
      <input id="login">
      <input id="password" type="password">
      <button type="submit" id="button" @click="sendData">Войти</button>
      <label id="forgot" @click="goRecovery">Забыли пароль?</label>
      <label id="registration" @click="goRegister">Зарегестрироваться</label>
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
              console.log("cuca  ", document.cookie)
              this.$emit('login-status')
              this.$router.push("/users")
            }
            else console.log(res)
          })
    },
    goRegister() {
      this.$router.push('/registration')
    },
    goRecovery() {
      this.$router.push('/recovery')
    }
  }
}
</script>

<style scoped>
.login {
  margin-top: 50px;
  font-size: 24px;
  padding: 20px;
  height: 400px;

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
#label, #login, #password, #button{
  margin: 10px 20px;
  font-size: 24px;
}
#registration, #forgot {
  font-size: 20px;
  margin: 10px;
}
#registration:hover, #forgot:hover {
  text-decoration: underline;
  cursor: pointer;
}
</style>