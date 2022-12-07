<template>
  <div class="header">
    <button @click="goLogin" v-if="!this.isLogin">
      Войти
    </button>
    <button @click="goOut" v-if="this.isLogin">
      Выйти
    </button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isLogin: false
    }
  },
  methods: {
    goLogin() {
      this.$router.push('/');
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

      console.log(cookie)
      if (cookie["user"]) this.isLogin = true;
    }
  },
  created() {
    console.log(document.cookie)
    this.checkCookie()
  }
}
</script>

<style scoped>
.header {
  height: 80px;
  background: var(--color-header-background);
  color: var(--color-white);
}
button {
  position: absolute;
  right: 0;
  margin: 20px;
  height: 40px;
  border-radius: 20px;
  background: var(--color-gray);
  font-size: 24px;
  color: var(--color-text);
  padding: 0 20px;
}
button:hover {
  cursor: pointer;
  background: var(--color-choose);
}
</style>