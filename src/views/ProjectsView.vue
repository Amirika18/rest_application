<script setup>
import Label from '../components/Label.vue'
import InputNewProject from "../components/InputNewProject.vue"
import ProjectLabel from '../components/ProjectLabel.vue'
</script>

<script>
 let max_len = 185;

 let items = [
   {name: "12345", description: "llllllllllllllll",
     id: "#000001", date_start: "10.02.2002", date_end: "12.10.2013"},
   {name: "12345", description: "Long Long LognLong Long LognLong Long LognLong Long LognLong Long LognLong Long LognLong Long LognLong Long LognLong Long LognLong Long LognLong Long LognLong Long LognLong Long LognLong Long Logn",
     id: "#000002", date_start: "03.12.2019", date_end: "24.03.2020"},
   {name: "12345", description: "llllllllllllllll llllllllllllllll llllllllllllllll",
     id: "#000003", date_start: "19.11.2000", date_end: "12.11.2003"}
 ]
 items.forEach(item => {
   item['period'] = item.date_start + '-' + item.date_end;
   if (item.description.length > max_len) {
     item.description = item.description.substring(0, 150) + '...';
   }
 })
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
      <ProjectLabel v-for="item in items"
                    :key="item.id">
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