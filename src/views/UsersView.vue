<script setup>
import HighLabel from '../components/HighLabel.vue'
import InputNewUser from '../components/InputNewUser.vue'
</script>

<template>
 <div>
   <HighLabel>
     <template #label>
        Сотрудники
     </template>
   </HighLabel>
   <InputNewUser />
 </div>
</template>

<style scoped>
div {
  margin: 20px;
}
</style>