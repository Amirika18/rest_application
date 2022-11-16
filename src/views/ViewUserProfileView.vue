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
      <template #name>fio</template>
      <template #department>dep</template>
      <template #position>position</template>
    </UserInformation>
    <ProjectInformation />
    <SkillsLabelProfile/>
  </div>
</template>

<script>
export default {
  methods: {
    getId() {
      return this.$router.currentRoute._value.fullPath.split('/')[2];
    }
  }
}
</script>

<style scoped>
div {
  margin: 20px;
}
</style>