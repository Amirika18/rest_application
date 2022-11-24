<script setup>
import EditLabel from '../components/editProfiles/EditLabel.vue'
import EditUserInformation from '../components/editProfiles/EditUserInformation.vue'
import ProjectInformation from '../components/userProfile/ProjectInformation.vue'
import SkillsLabelProfile from '../components/editProfiles/SkillsLabelProfile.vue'
import SaveButton from '../components/editProfiles/SaveButton.vue'
import DeleteButton from '../components/editProfiles/DeleteButton.vue'
</script>

<template>
  <div>
    <EditLabel>
      <template #label>
        Редактировать профиль сотрудника
      </template>
    </EditLabel>
    <EditUserInformation />
    <ProjectInformation />
    <SkillsLabelProfile v-bind="searchProps" @update-data="updateSkills"/>
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
  data() {
    return {
      userdata: {
        name: "",
        surname: "",
        patronymic: "",
        department: "",
        position: ""
      },
      deleteSkills: new Set(),
      addSkills: new Set(),
      buttonTextSave: "Сохранить",
      buttonTextDelete: "Удалить"
    }
  },
  name: "EditUserProfileView",
  methods: {
    save() {
      this.getActualData();
      let userData = this.userdata;
      let deleted = this.deleteSkills;
      let added = this.addSkills;

      let id = this.getId();
      let url = urlDb + "/db_api/users/" + id + "/edit";
      fetch(url, {
        method: "post",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          user: userData,
          del: Array.from(deleted),
          add: Array.from(added)
        })
      });

      this.buttonTextSave = "Загрузка..."
      setTimeout(() => this.$router.go(-1), 1000);
    },
    del() {
      let id = this.getId();
      let url = urlDb + "/db_api/users/" + id + "/delete";
      let send = confirm("Вы уверены, что хотите удалить пользователя?");
      if (send) {
        fetch(url, {
          method: "post",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify({
            id: id
          })
        });

        this.buttonTextDelete = "Загрузка..."
        setTimeout(() => this.$router.go(-2), 1000);
      }
    },
    getId() {
      return this.$router.currentRoute._value.fullPath.split('/')[2];
    },
    updateSkills(deleteSkills, addSkills) {
      this.deleteSkills = deleteSkills;
      this.addSkills = addSkills;
    },
    getUserdata() {
      let id = this.getId();
      let url = urlDb + '/db_api/users/' + id;
      fetch(url, {method: "get"})
      .then( res => {return res.json()})
      .then(data => {
        this.userdata.name = data.name;
        this.userdata.surname = data.surname;
        this.userdata.patronymic = data.patronymic;
        this.userdata.position = data.pos_id;
        this.userdata.department = data.dep_id;

        const name = document.getElementById("name_input");
        const surname = document.getElementById("surname_input");
        const patronymic = document.getElementById("patronymic_input");

        name.value = data.name;
        surname.value = data.surname;
        patronymic.value = data.patronymic;
        return data;
      })
    },
    getActualData() {
      const name = document.getElementById("name_input");
      const surname = document.getElementById("surname_input");
      const patronymic = document.getElementById("patronymic_input");
      const department = document.getElementById("department_input");
      const position = document.getElementById("position_input");

      this.userdata.department = department.value;
      this.userdata.position = position.value;
      this.userdata.name = name.value;
      this.userdata.surname = surname.value;
      this.userdata.patronymic = patronymic.value;
    }
  },
  mounted() {
    this.getUserdata();
  }
}
</script>

<style scoped>
div {
  margin: 20px;
}
</style>