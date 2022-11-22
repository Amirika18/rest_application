<script setup>
import ProjectLabelProfile from './ProjectLabelProfile.vue'
</script>

<script>
import urlDb from '../../../params.js';

export default {
  methods: {
    getId() {
      return this.$router.currentRoute._value.fullPath.split('/')[2];
    },
    getData() {
      let id = this.getId();
      let url = urlDb + "/db_api/users/" + id + "/projects";
      fetch(url, {
        method: "get"
      })
      .then(res => {
        return res.json()
      })
      .then(data => {
        let items = [];
        data.forEach(project => {
          items.push({
            id: "#" + String(project.id).padStart(6, '0'),
            project_name: project.project,
            role: project.access
          })
        })
        this.responseData = items;
        return items;
      })
    }
  },
  data() {
    return {
      responseData: []
    }
  },
  created() {
    this.getData();
  }
}
</script>

<template>
  <div class="projects">
    <div class="name" id="name">
      Проекты
    </div>
    <ProjectLabelProfile v-for="item in this.responseData" :key="item.id">
      <template #project_name>{{ item.project_name }}</template>
      <template #role>{{ item.role }}</template>
    </ProjectLabelProfile>
  </div>
</template>

<style scoped>
.projects {
  display: grid;
  grid-template-rows: 1fr 1fr;
  min-height: 120px;
  border-radius: 30px;
  border-style: none;
  background: var(--color-gray);
  align-items: center;
  padding: 10px;
}
#name {
  font-weight: bold;
  margin-left: 20px;
  margin-right: 20px;
}
div {
  font-size: 24px;
  color: var(--color-text);
}
</style>