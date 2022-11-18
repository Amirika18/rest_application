<script setup>
import EditLabel from '../components/EditLabel.vue'
import UserInformation from '../components/userProfile/UserInformation.vue'
import ProjectInformation from '../components/userProfile/ProjectInformation.vue'
import SkillsLabelProfile from '../components/userProfile/SkillsLabelProfile.vue'
</script>

<template>
  <div>
    <EditLabel>
      <template #label>
        Профиль сотрудника
      </template>
    </EditLabel>
    <UserInformation>
      <template #name>{{ this.responseData.name }}</template>
      <template #department>{{ this.responseData.department }}</template>
      <template #position>{{ this.responseData.position }}</template>
    </UserInformation>
    <ProjectInformation />
    <SkillsLabelProfile/>
  </div>
</template>

<script>
import urlDb from '../../params';

export default {
  created() {
    this.getData();
  },
  data() {
    return {
      responseData: {}
    }
  },
  methods: {
    getId() {
      return this.$router.currentRoute._value.fullPath.split('/')[2];
    },
    getData() {
      let url = urlDb + '/db_api/users/' + this.getId();
      fetch(url, {
        method: "get"
      })
      .then( res => {
        return res.json()
      })
      .then(data => {
        let items = {
          id: "#" + String(data.data.id).padStart(6, '0'),
          name: data.data.surname + " " + data.data.name + " " + data.data.patronymic,
          department: data.data.department,
          position: data.data.position
        };
        this.responseData = items;
        return items;
      })
    }
  }
}
</script>

<style scoped>
div {
  margin: 20px;
}
</style>