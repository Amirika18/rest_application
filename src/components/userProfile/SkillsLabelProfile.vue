<script setup>
import SkillBubble from './SkillBubble.vue'
</script>

<template>
  <div id="label_skill">
    <div id="skills">Навыки</div>
    <div class="row">
      <SkillBubble v-for="item in this.responseData" :key="item.id">
        <template #skill>{{ item.skill }}</template>
      </SkillBubble>
    </div>
  </div>
</template>

<script>
import urlDb from '../../../params.js';

export default {
  name: "SkillLabelProfile",
  methods: {
    getData() {
      let id = this.getId();
      let url = urlDb + "/db_api/users/" + id + "/skills";
      fetch(url, {
        method: "get"
      })
      .then(res => {
        return res.json()
      })
      .then(data => {
        let items = [];
        data.data.forEach(skill => {
          items.push({
            id: "#" + String(skill.id).padStart(6, '0'),
            skill: skill.skill
          })
        })
        this.responseData = items;
        return items;
      })
    },
    getId() {
      return this.$router.currentRoute._value.fullPath.split('/')[2];
    }
  },
  created() {
    this.getData()
  },
  data() {
    return {
      responseData: []
    }
  }
}
</script>

<style scoped>
#label_skill {
  border-style: none;
  border-radius: 30px;
  background: var(--color-gray);
  display: grid;
  grid-template-rows: auto;
  align-items: center;
  padding: 10px 20px;
}
.row {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
}
#skills {
  margin-left: 10px;
  font-weight: bold;
  height: 60px;
  padding-top: 10px;
}
</style>