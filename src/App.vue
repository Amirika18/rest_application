<script setup>
import { RouterLink, RouterView } from 'vue-router'
import Menu from  './components/Menu.vue'
import Header from './components/Header.vue'
import Login from './views/Login.vue'
</script>

<template>
  <Header />
  <div class="container" v-if="this.$route.meta.layout==null">
    <Menu />
    <RouterView />
  </div>
  <div class="login"  v-if="this.$route.meta.layout==='login'">
    <Login></Login>
  </div>
</template>

<style scoped>
.container {
  display: grid;
  grid-template-columns: 1fr 3fr 1fr;
}
</style>
