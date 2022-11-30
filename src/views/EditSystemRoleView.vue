<script setup>
import EditLabel from '../components/editProfiles/EditLabel.vue'
import SaveButton from '../components/editProfiles/SaveButton.vue'
import DeleteButton from '../components/editProfiles/DeleteButton.vue'
import EditRoleInput from '../components/editProfiles/EditRoleInput.vue'
</script>

<template>
  <div>
    <EditLabel>
      <template #label>Редактировать роль</template>
    </EditLabel>
    <EditRoleInput></EditRoleInput>
    <DeleteButton @click="del">
      <template #label>{{ this.delText }}</template>
    </DeleteButton>
    <SaveButton @click="save">
      <template #label>{{ this.saveText }}</template>
    </SaveButton>
  </div>
</template>

<script>
import urlDb from '../../params.js';

export default {
  data() {
    return {
      saveText: "Сохранить",
      delText: "Удалить",
      role: "",
      isActive: false
    }
  },
  name: "EditSystemRoleView",
  methods: {
    del() {
      let id = this.getId();
      let url = urlDb + "/db_api/system_roles/" + id + "/delete";
      let send = confirm("Вы уверены, что хотите удалить роль?");

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
            this.delText = "Загрузка..."
            setTimeout(() => this.$router.go(-1), 1000);
          }
          else if (res.status === 404) {
            alert("Not found")
          }
        })
        .catch(err => alert(err));
      }
    },
    save() {
      let id = this.getId();
      let url = urlDb + '/db_api/system_roles/' + id + '/edit';

      const role = document.getElementById("role_input");
      this.role = role.value;

      if (!this.isActive) {
        fetch(url, {
          method: "post",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify({
            name: this.role
          })
        })
        .then(res => {
          if (res.ok) {
            this.saveText = "Загрузка..."
            setTimeout(() => this.$router.go(-1), 1000);
          }
          else if (res.status === 404) {
            alert("Not found")
          }
        })
        .catch(err => alert(err));
      }
      this.isActive = true;
    },
    getId() {
      return this.$router.currentRoute._value.fullPath.split('/')[2];
    },
    setData() {
      let id = this.getId();
      let url = urlDb + '/db_api/system_roles/' + id;

      fetch(url, {
        method: 'get'
      })
      .then(res => res.json())
      .then(data => {
        console.log(data)
        const role = document.getElementById("role_input");

        role.value = data.system_role.name;
        this.role = data.system_role.name;
      })
    }
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