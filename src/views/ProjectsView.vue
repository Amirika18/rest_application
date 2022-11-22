<script setup>
import Label from '../components/Label.vue'
import InputNewProject from "../components/InputNewProject.vue"
import ProjectLabel from '../components/ProjectLabel.vue'
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
       let url = '/view_project/' + id.substring(1);
       this.$router.push({path: url, param: {id: id}});
     },
     getData() {
       let url = urlDb + '/db_api/projects';
       let maxLength = 185;

       fetch(url, {
         method: "get"
       })
       .then( res => {
         return res.json()
       })
       .then(data => {
         let items = [];
          data.forEach(project => {
           items.push({
             id: "#" + String(project.id).padStart(6, '0'),
             name: project.name,
             description: project.description,
             date_start: project.start,
             date_end: project.end
           })
         })
         items.forEach(item => {
           if (item.description.length > maxLength) {
             item.description = item.description.substring(0, 150) + '...';
           }
           if (!item.end) {
             item["period"] = item.date_start + " - н.в.";
           }
           else {
             item["period"] = item.date_start + " - " + item.date_end;
           }
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
        Проекты
      </template>
    </Label>
    <InputNewProject />
    <container>
      <ProjectLabel v-for="item in this.responseData"
                    :key="item.id" @click="link(item.id)">
        <template #name>
          {{ item.name }}
        </template>
        <template #id>
          {{ item.id }}
        </template>
        <template #description>
          {{ item.description }}
        </template>
        <template #date>
          {{ item.period }}
        </template>
      </ProjectLabel>
    </container>
  </div>
</template>

<style scoped>
div {
  margin: 20px;
}
</style>