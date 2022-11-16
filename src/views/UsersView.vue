<script setup>
import Label from '../components/Label.vue'
import InputNewUser from '../components/InputNewUser.vue'
import UserLabel from '../components/UserLabel.vue'
</script>

<script>
  let items = [
    {id: "#000001", name: "Test", active: true},
    {id: "#000002", name: "Test1", active: false},
    {id: "#000003", name: "Test2", active: false},
    {id: "#000004", name: "Test3", active: true}
  ];

  export default {
    methods: {
      link(id) {
        let url = '/view_user/' + id.substring(1);
        this.$router.push({path: url, param: {id: id}});
      }
    }
  }
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
                :class="{'inactive' : !item.active}" @click="link(item.id)">
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