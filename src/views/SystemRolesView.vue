<script setup>
import Label from '../components/Label.vue'
import InputNewSystemRole from '../components/InputNewSystemRole.vue'
import SystemRoleLabel from '../components/SystemRoleLabel.vue'
</script>

<script>
import urlDb from '../../params.js';

export default {
  data() {
    return {
      responseData: []
    }
  },
  methods: {
    link(id) {
      let url = '/edit_system_role/' + id.substring(1);
      this.$router.push({path: url, param: {id: id}});
    },
    getData() {
      let url = urlDb + '/db_api/system_roles';

      fetch(url, {
        method: "get"
      })
      .then( res => {
        return res.json()
      })
      .then(data => {
        let items = [];
        data.forEach(role => {
          items.push({
            id: "#" + String(role.id).padStart(6, '0'),
            name: role.name
          })
        })
        this.responseData = items;
        return items;
      })
    }
  },
  created() {
    this.getData();
  }
}
</script>

<template>
  <div>
    <Label>
      <template #label>
        Роли в системе
      </template>
    </Label>
    <InputNewSystemRole />
    <container>
      <SystemRoleLabel v-for="item in this.responseData"
                       @click="link(item.id)"
                       :key="item.id">
        <template #role>
          {{ item.name }}
        </template>
        <template #id>
          {{ item.id }}
        </template>
      </SystemRoleLabel>
    </container>
  </div>
</template>

<style scoped>
div {
  margin: 20px;
}
</style>