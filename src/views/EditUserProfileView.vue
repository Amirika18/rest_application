<script setup>
import EditLabel from '../components/edit/EditLabel.vue'
</script>

<template>
  <div>
    <EditLabel>
      <template #label>
        Профиль сотрудника
      </template>
    </EditLabel>
  </div>
</template>

<script>
export default {
  methods: {
    getId() {
      return this.$router.currentRoute._value.fullPath.split('/')[2];
    }
  }
}
</script>

<style scoped>
div {
  margin: 20px;
}
</style>