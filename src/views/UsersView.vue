<script setup>
import Label from '../components/Label.vue'
import InputNewUser from '../components/InputNewUser.vue'
import UserLabel from '../components/UserLabel.vue'
</script>

<script>
import urlDb from '../../params';

export default {
  data() {
    return {
      responseData: [],
      name: "dsdsds"
    }
  },
  methods: {
    link(id) {
      let url = '/view_user/' + id.substring(1);
      this.$router.push({path: url, param: {id: id}});
    },
    getData() {
      let url = urlDb + '/db_api/users';
      fetch(url, {
        method: "get"
      })
      .then( res => {
        return res.json()
      })
      .then(data => {
        let items = [];
        data.data.forEach(user => {
          items.push({
            id: "#" + String(user.id).padStart(6, '0'),
            name: user.surname + " " + user.name + " " + user.patronymic,
            active: user.active
          })
        })
        this.responseData = items;
        return items;
      })
    }
  },
  created() {
    this.getData()
  },
  beforeCreate() {}
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
     <UserLabel v-for="item in this.responseData"
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