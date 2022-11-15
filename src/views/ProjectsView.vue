<!--/projects-->
<script setup>
import InputNewProject from "../components/listElements/InputNewProject.vue";
</script>

<template>
  <div>
    <Label>
      <template #label>
        Сотрудники
      </template>
    </Label>
    <InputNewProject />
    <UserLabel>
      <template #name>
        Фамилия имя отчество
      </template>
      <template #id>
        #000001
      </template>
    </UserLabel>
  </div>
</template>

<style scoped>
div {
  margin: 20px;
  width: ;
}
</style>