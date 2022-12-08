<script setup>
import { RouterLink, RouterView } from 'vue-router'
import Menu from  './components/Menu.vue'
import Header from './components/Header.vue'
import Login from './views/Login.vue'
import Registration from './views/Registration.vue'
</script>

<template>
  <Header ref="header"/>
  <div class="container" v-if="this.$route.meta.layout==null">
    <Menu />
    <RouterView />
  </div>
  <div class="login" v-if="this.$route.meta.layout==='login'">
    <Login @login-status="changeHeader"></Login>
  </div>
  <div class="registration" v-if="this.$route.meta.layout==='registration'">
    <Registration @registration="userRegistration"></Registration>
  </div>
</template>

<script>
export default {
  methods: {
    changeHeader() {
      this.$refs.header.login();
    },
    userRegistration() {
      this.$refs.header.registration();
    }
  }
}
</script>

<style scoped>
.container {
  display: grid;
  grid-template-columns: 1fr 3fr 1fr;
}
</style>
