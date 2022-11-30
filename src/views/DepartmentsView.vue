<script setup>
import Label from '../components/Label.vue'
import InputNewDepartment from '../components/InputNewDepartment.vue'
import DepartmentLabel from '../components/DepartmentLabel.vue'
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
      let url = '/view_department/' + id.substring(1);
      this.$router.push({path: url, param: {id: id}});
    },
    getData() {
      let url = urlDb + '/db_api/departments';

      fetch(url, {
        method: "get"
      })
      .then( res => {
        return res.json()
      })
      .then(data => {
        let items = [];
        data.forEach(department => {
          items.push({
            id: "#" + String(department.id).padStart(6, '0'),
            name: department.name
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
        Отделы
      </template>
    </Label>
    <InputNewDepartment />
    <container>
      <DepartmentLabel v-for="item in this.responseData"
                       @click="link(item.id)"
                 :key="item.id">
        <template #department>
          {{ item.name }}
        </template>
        <template #id>
          {{ item.id }}
        </template>
      </DepartmentLabel>
    </container>
  </div>
</template>

<style scoped>
div {
  margin: 20px;
}
</style>