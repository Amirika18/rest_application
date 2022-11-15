<!--/users-->
<script setup>
import Label from '../components/listElements/Label.vue'
import InputNewUser from '../components/listElements/InputNewUser.vue'
import UserLabel from '../components/listElements/UserLabel.vue'
import ContentHolder from "../components/ContentHolder.vue";
</script>

<template>
 <div>
   <Label>
     <template #label>
        Сотрудники
     </template>
   </Label>
   <InputNewUser />
   <UserLabel>
     <template #name>
       Фамилия имя отчество
     </template>
     <template #id>
       #000001
     </template>
   </UserLabel>
 </div>
</template>

<style scoped>
div {
  margin: 20px;
}
</style>