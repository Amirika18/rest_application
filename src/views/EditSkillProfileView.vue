<script setup>
import EditLabel from '../components/editProfiles/EditLabel.vue'
import SaveButton from '../components/editProfiles/SaveButton.vue'
import DeleteButton from '../components/editProfiles/DeleteButton.vue'
import EditSkillInformation from '../components/editProfiles/EditSkillInformation.vue'
</script>

<template>
  <div>
    <EditLabel>
      <template #label>Редактировать навык</template>
    </EditLabel>
    <EditSkillInformation>

    </EditSkillInformation>
    <DeleteButton @click="del">
      <template #label>{{ this.buttonTextDelete }}</template>
    </DeleteButton>
    <SaveButton @click="save">
      <template #label>{{ this.buttonTextSave }}</template>
    </SaveButton>
  </div>
</template>

<script>
import urlDb from '../../params.js';

export default {
  name: "EditSkillProfileView",
  data() {
    return {
      skillName: "",
      description: "",
      buttonTextSave: "Сохранить",
      buttonTextDelete: "Удалить",
      isActive: false
    }
  },
  methods: {
    getId() {
      return this.$router.currentRoute._value.fullPath.split('/')[2];
    },
    setData() {
      let id = this.getId();
      let url = urlDb + '/db_api/skills/' + id;

      fetch(url, {method: "get"})
          .then( res => {return res.json()})
          .then(data => {
            this.skillName = data.skill.name;
            this.description = data.skill.description;

            const skill = document.getElementById("skill_input");
            const description = document.getElementById("description_input");
            console.log(data)
            skill.value = data.skill.name;
            if (data.skill.description !== "No description")
              description.value = data.skill.description;
            return data;
          })
    },
    save() {
      const skill = document.getElementById("skill_input");
      const description = document.getElementById("description_input");

      this.skillName = skill.value;
      this.description = description.value;
      let id = this.getId();
      let url = urlDb + "/db_api/skills/" + id + "/edit";

      if (!this.isActive) {
        fetch(url, {
          method: "post",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify({
            name: this.skillName,
            description: this.description
          })
        })
        .then(res => {
          if (res.ok) {
            this.buttonTextSave = "Загрузка..."
            setTimeout(() => this.$router.go(-1), 1000);
          }
          else if (res.status === 404) {
            alert("Что-то пошло не так :(")
          }
        })
        .catch(err => alert(err));
      }
      this.isActive = true;
    },
    del() {
      let id = this.getId();
      let url = urlDb + "/db_api/skills/" + id + "/delete";
      let send = confirm("Вы уверены, что хотите удалить навык?");
      if (send) {
        fetch(url, {
          method: "post",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify({
            id: id
          })
        })
        .then(res => {
          if (res.ok) {
            this.buttonTextDelete = "Загрузка..."
            setTimeout(() => this.$router.go(-2), 1000);
          }
          else if (res.status === 404) {
            alert("Что-то пошло не так :(")
          }
        })
        .catch(err => alert(err));
      }
    },
  },
  mounted() {
    this.setData();
  }
}
</script>

<style scoped>
div {
  margin: 20px;
}
</style>