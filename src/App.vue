<script setup>
import { RouterLink, RouterView } from 'vue-router'
import Menu from  './components/Menu.vue'
import Header from './components/Header.vue'
</script>

<template>
  <Header />
  <div class="container">
    <Menu />
    <RouterView />
  </div>
</template>

<style scoped>
.container {
  display: grid;
  grid-template-columns: 1fr 3fr 1fr;
}
</style>
