<script setup>
import Label from '../components/Label.vue'
import InputNewUser from '../components/InputNewUser.vue'
import UserLabel from '../components/UserLabel.vue'
</script>

<script>
  var items = [
    {id: "#000001", name: "овсов овес овесович", active: true},
    {id: "#000002", name: "ивашка", active: false},
    {id: "#000003", name: "дурашка", active: false},
    {id: "#000004", name: "великий человек", active: true}
  ];
</script>

<template>
 <div>
   <Label>
     <template #label>
        Сотрудники
     </template>
   </Label>
   <InputNewUser />
   <container>
     <UserLabel v-for="item in items"
                :key="item.id"
                :class="{'inactive' : !item.active}">
       <template #name>
         {{ item.name }}
       </template>
       <template #id>
         {{ item.id }}
       </template>
     </UserLabel>
   </container>
 </div>
</template>

<style scoped>
div {
  margin: 20px;
}
.inactive {
  background: var(--color-disable-user);
}
</style>