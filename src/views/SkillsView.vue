<script setup>
import Label from '../components/Label.vue'
import InputNewSkill from '../components/InputNewSkill.vue'
import SkillLabel from '../components/SkillLabel.vue'
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
      let url = '/view_skill/' + id.substring(1);
      this.$router.push({path: url, param: {id: id}});
    },
    getData() {
      let url = urlDb + '/db_api/skills';
      let maxLength = 40;

      fetch(url, {
        method: "get"
      })
      .then( res => {
        return res.json()
      })
      .then(data => {
        let items = [];
        data.forEach(skill => {
          items.push({
            id: "#" + String(skill.id).padStart(6, '0'),
            name: skill.name,
            description: skill.description
          })
        })
        items.forEach(item => {
          if (item.description && item.description.length > maxLength) {
            item.description = item.description.substring(0, 40) + '...';
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
        Навыки
      </template>
    </Label>
    <InputNewSkill />
    <container>
      <SkillLabel v-for="item in responseData"
                 :key="item.id" @click="link(item.id)">
        <template #name>
          {{ item.name }}
        </template>
        <template #id>
          {{ item.id }}
        </template>
      </SkillLabel>
    </container>
  </div>
</template>

<style scoped>
div {
  margin: 20px;
}
</style>