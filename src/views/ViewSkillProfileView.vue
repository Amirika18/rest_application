<script setup>
import EditLabel from '../components/EditLabel.vue'
import Label from '../components/Label.vue'
import SkillLabelProfile from '../components/skillProfile/SkillLabelProfile.vue'
import UserLabel from '../components/UserLabel.vue'
</script>

<template>
  <div>
    <EditLabel>
      <template #label>
        Страница навыка
      </template>
    </EditLabel>
    <SkillLabelProfile>
      <template #name>Skill</template>
      <template #description>Description</template>
    </SkillLabelProfile>
    <Label>
      <template #label>
        Подходящие сотрудники
      </template>
    </Label>
    <container>
      <UserLabel v-for="item in items"
                 :key="item.id"
                 @click="link(item.id)">
        <template #name>
          {{ item.name }}
        </template>
        <template #id>
          {{ item.id }}
        </template>
      </UserLabel>
    </container>
  </div>
</template>

<script>
let items = [
  {id: "#000001", name: "Test", active: true},
  {id: "#000002", name: "Test1", active: false},
  {id: "#000003", name: "Test2", active: false},
  {id: "#000004", name: "Test3", active: true}
];

export default {
  methods: {
    getId() {
      return this.$router.currentRoute._value.fullPath.split('/')[2];
    },
    link(id) {
      let url = '/view_profile/' + id.substring(1);
      this.$router.push({path: url, param: {id: id}});
    }
  }
}
</script>

<style scoped>
div {
  margin: 20px;
}
</style>