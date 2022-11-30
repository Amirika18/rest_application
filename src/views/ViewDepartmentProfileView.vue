<script setup>
import EditLabel from '../components/EditLabel.vue'
import DepartmentLabelView from '../components/departmentProfile/DepartmentLabelView.vue'
import Label from '../components/Label.vue'
import UserLabel from '../components/UserLabel.vue'
</script>

<script>
import urlDb from '../../params.js';
export default {
  data() {
    return {
      responseData: [],
      name: ""
    }
  },
  methods: {
    getId() {
      return this.$router.currentRoute._value.fullPath.split('/')[2]
    },
    link(id) {
      let url = '/view_user/' + id.substring(1);
      this.$router.push({path: url, param: {id: id}});
    },
    getData() {
      let id = this.getId();
      let url = urlDb + '/db_api/departments/' + id;

      fetch(url, {
        method: "get"
      })
      .then( res => {
        return res.json()
      })
      .then(data => {
        let items = [];
        this.name = data.department.name;
        data.users.forEach(user => {
          items.push({
            id: "#" + String(user.id).padStart(6, '0'),
            name: user.surname + " " + user.name + " " + user.patronymic
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
    <EditLabel>
      <template #label>
        Страница отдела
      </template>
    </EditLabel>
    <DepartmentLabelView>
      <template #department>{{ this.name }}</template>
    </DepartmentLabelView>
    <Label>
      <template #label>
        Сотрудники
      </template>
    </Label>
    <container>
      <UserLabel v-for="item in this.responseData"
                 key="item.id"
                 @click="link(item.id)">
        <template #name>{{ item.name }}</template>
        <template #id>{{ item.id }}</template>
      </UserLabel>
    </container>
  </div>
</template>

<style scoped>
div {
  margin: 20px;
}
</style>