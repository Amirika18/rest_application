<template>
  <div class="header">
    <div v-if="!this.isLogin">
      <button @click="goLogin">
        Войти
      </button>
    </div>
    <div v-if="this.isLogin">
      <button @click="goOut">
        Выйти
      </button>
    </div>
    <label id="user" class="user" @click="goToProfile" v-if="this.isLogin">{{this.user}}</label>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isLogin: false,
      user: ""
    }
  },
  methods: {
    goLogin() {
      this.$router.push('/');
    },
    goToProfile() {

    },
    goOut() {
      this.isLogin = false;
      document.cookie = "user=";
      this.$router.push('/');
    },
    checkCookie() {
      const cook = document.cookie;
      let params = cook.split(';');
      let cookie = [];
      params.forEach(item => {
        const key = item.split("=")[0];
        cookie[key] = item.split("=")[1];
      })

      if (cookie["user"]) {
        this.isLogin = true;
        this.user = cookie["user"];
      }
      return cookie["user"]
    },
    login() {
      this.user = this.checkCookie();
      this.isLogin = true;
      console.log(this.isLogin);
    },
    registration() {

    }
  },
  mounted() {
    this.checkCookie()
  }
}
</script>

<style scoped>
.header {
  height: 80px;
  background: var(--color-header-background);
  color: var(--color-white);
  display: flex;
  flex-direction: row-reverse;
}
button {
  position: relative;
  right: 0;
  margin: 20px;
  height: 40px;
  border-radius: 20px;
  background: var(--color-gray);
  font-size: 24px;
  color: var(--color-text);
  padding: 0 20px;
  border-style: none;
}
button:hover {
  cursor: pointer;
  background: var(--color-choose);
}
.user {
  font-size: 24px;
  margin: 20px;
  height: 40px;
  padding: 0 20px;
}
.user:hover {
  text-decoration: underline;
  cursor: pointer;
}
</style>