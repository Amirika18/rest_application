<script setup>
import EditLabel from '../components/EditLabel.vue'
import Label from '../components/Label.vue'
import SkillLabelProfile from '../components/skillProfile/SkillLabelProfile.vue'
import UserLabel from '../components/UserLabel.vue'
</script>

<script>
import urlDb from '../../params.js';

export default {
  data() {
    return {
      responseData: [],
      name: "",
      description: ""
    }
  },
  methods: {
    getId() {
      return this.$router.currentRoute._value.fullPath.split('/')[2];
    },
    link(id) {
      let url = '/view_user/' + id.substring(1);
      this.$router.push({path: url, param: {id: id}});
    },
    getData() {
      let id = this.getId();
      let url = urlDb + '/db_api/skills/' + id;

      fetch(url, {
        method: "get"
      })
      .then( res => {
        return res.json()
      })
      .then(data => {
        this.name = data.skill.name;
        this.description = data.skill.description;
        let items = [];
        data.users.forEach(user => {
          items.push({
            name: user.surname + " " + user.name + " " + user.patronymic,
            id: "#" + String(user.id).padStart(6, '0')
          });
        });

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
    <EditLabel>
      <template #label>
        Страница навыка
      </template>
    </EditLabel>
    <SkillLabelProfile>
      <template #name>{{ this.name }}</template>
      <template #description>{{ this.description }}</template>
    </SkillLabelProfile>
    <Label>
      <template #label>
        Подходящие сотрудники
      </template>
    </Label>
    <container>
      <UserLabel v-for="item in this.responseData"
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

<style scoped>
div {
  margin: 20px;
}
</style>