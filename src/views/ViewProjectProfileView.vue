<script setup>
import EditLabel from '../components/EditLabel.vue'
import Label from '../components/Label.vue'
import ProjectLabelProfile from '../components/projectProfile/ProjectLabelProfile.vue'
import UserLabel from '../components/UserLabel.vue'
</script>

<template>
  <div>
    <EditLabel>
      <template #label>
        Страница проекта
      </template>
    </EditLabel>
    <ProjectLabelProfile>
      <template #name>{{ this.name }}</template>
      <template #description>{{ this.description }}</template>
      <template #start_date>{{ this.start_date }}</template>
      <template #end_date>{{ this.end_date }}</template>
    </ProjectLabelProfile>
    <Label>
      <template #label>
        Команда
      </template>
    </Label>
    <container>
      <UserLabel v-for="item in this.responseData"
                 :key="item.id"
                 @click="link(item.id)">
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

<script>
import urlDb from '../../params.js';

export default {
  data() {
    return {
      name: "",
      end_date: "",
      start_date: "",
      description: "",
      responseData: []
    }
  },
  methods: {
    getId() {
      return this.$router.currentRoute._value.fullPath.split('/')[2];
    },
    link(id) {
      let url = '/view_user/' + id.substring(1);
      this.$router.push({path: url, param: {id: id}});
    },
    getData() {
      let id = this.getId();
      let url = urlDb + '/db_api/projects/' + id;

      fetch(url, {
        method: "get"
      })
      .then( res => {
        return res.json()
      })
      .then(data => {
        let items = [];
        this.name = data.project.name;
        this.description = data.project.description;
        this.start_date = "C " + data.project.start;
        if (!data.project.end) {
          this.end_date = "По н.в."
        }
        else {
          this.end_date = "По " + data.project.end;
        }

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
    this.getData()
  }
}
</script>

<style scoped>
div {
  margin: 20px;
}
</style>