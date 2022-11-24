<script setup>
import SkillBubble from './SkillBubble.vue'</script>

<template>
  <div id="label_skill">
    <div id="skills">Навыки</div>
    <div class="row">
      <SkillBubble v-for="item in this.responseData"
                   :key="item.id"
                   @delete-skill="deleteSkill(item.id)">
        <template #skill>{{ item.skill }}</template>
      </SkillBubble>
    </div>
    <div class="add">
      <div class="input">
        <select v-model="activeSkill" id="new_skill">
          <option v-for="item in this.skills" :value="item.id">
            {{ item.name }}
          </option>
        </select>
      </div>
      <div class="button" @click="addSkill">Добавить</div>
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
            data.forEach(skill => {
              items.push({
                id: String(skill.skill_id).padStart(6, '0'),
                skill: skill.skill
              })
            })
            this.responseData = items;
            let url_skills = urlDb + "/db_api/skills"
            fetch(url_skills, {method: "get"})
                .then( res => {return res.json()})
                .then(data => {
                  let items = [];
                  data.forEach(skill => {
                    items.push({
                      id: String(skill.id).padStart(6, '0'),
                      name: skill.name
                    })
                  })
                  this.skills = this.changeList(this.responseData, items);
                  return items;
                })
      })
    },
    changeList(userSkills, allSkills) {
      let availableSkills = [];
      allSkills.forEach(skill => {
        let check = false;
        userSkills.forEach(user => {
          if (skill.id === user.id) check = true;
        })
        if (!check) availableSkills.push(skill);
      })
      return availableSkills
    },
    getId() {
      return this.$router.currentRoute._value.fullPath.split('/')[2];
    },
    deleteSkill(id) {
      let newArray = [];
      this.responseData.forEach(item => {
        if (item.id !== id) {
          newArray.push({
            id: String(item.id),
            skill: item.skill
          })
        }
        else {
          this.skills.push({
            id: String(item.id),
            name: item.skill
          });

          if (this.addSkills.has(item.id)) {
            this.addSkills.delete(item.id);
          }
          else {
            if (!this.deleteSkills.has(item.id)) {
              this.deleteSkills.add(item.id)
            }
          }
        }
      })

      this.responseData = newArray;
      this.$emit('update-data', this.deleteSkills, this.addSkills);
    },
    addSkill() {
      const skill = document.getElementById("new_skill");
      let id = skill.value;
      if (id !== ""){
        let isExist = false;
        this.responseData.forEach(item => {
          if (item.id === id) isExist = true;
        })
        if (!isExist) {
          let skillValue = "";
          this.skills.forEach(skill => {
            if (skill.id === id) skillValue = skill.name;
          })
          this.responseData.push({
            id: String(id),
            skill: skillValue
          })

          let tempArr = [];
          this.skills.forEach(skill => {
            if (id !== skill.id) {
              tempArr.push(skill);
            }
          })
          this.skills = tempArr;
          console.log(this.skills)
        }

        if (this.deleteSkills.has(id)) {
          this.deleteSkills.delete(id);
        }
        else {
          if (!this.addSkills.has(id) && !isExist) {
            this.addSkills.add(id);
          }
        }
      }
      this.$emit('update-data', this.deleteSkills, this.addSkills);
    }
  },
  created() {
    this.getData()
  },
  data() {
    return {
      responseData: [],
      deleteSkills: new Set(),
      addSkills: new Set(),
      skills: [],
      activeSkill: ""
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
.add {
  display: flex;
  flex-direction: row;
  padding: 0 10px;
}
.button {
  height: 50px;
  margin: 10px;
  background: var(--color-header-background);
  color: var(--color-white);
  font-size: 24px;
  padding: 5px 10px;
  text-align: center;
  border-style: none;
  border-radius: 30px;
  cursor: pointer;
}
.input, select {
  width: 100%;
  padding: 10px 10px 10px 0;
  font-size: 24px;
  border-style: none;
  border-radius: 5px;
}
</style>