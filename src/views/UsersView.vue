<script setup>
import Label from '../components/Label.vue'
import InputNewUser from '../components/InputNewUser.vue'
import UserLabel from '../components/UserLabel.vue'
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

<script>
import ContentHolder from "../components/listElements/ContentHolder.vue";
export default {
  name: "UsersView",
  components: {InputNewUser, ContentHolder}
}
import HighLabel from '../components/HighLabel.vue'
import InputNewUser from '../components/InputNewUser.vue'

</script>

<style scoped>
div {
  margin: 20px;
}
</style>