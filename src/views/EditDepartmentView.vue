<script setup>
import EditLabel from '../components/editProfiles/EditLabel.vue'
import EditOneInput from '../components/editProfiles/EditOneInput.vue'
import SaveButton from '../components/editProfiles/SaveButton.vue'
import DeleteButton from '../components/editProfiles/DeleteButton.vue'
</script>

<template>
  <div>
    <EditLabel>
      <template #label>Редактирование отдела</template>
    </EditLabel>
    <EditOneInput></EditOneInput>
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
  name: "EditDepartmentView",
  data() {
    return {
      saveText: "Сохранить",
      delText: "Удалить",
      department: "",
      isActive: false
    }
  },
  methods: {
    del() {
      let id = this.getId();
      let url = urlDb + "/db_api/departments/" + id + "/delete";
      let send = confirm("Вы уверены, что хотите удалить отдел?");

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
            setTimeout(() => this.$router.go(-2), 1000);
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
      let url = urlDb + '/db_api/departments/' + id + '/edit';

      const department = document.getElementById("input");
      this.department = department.value;

      if (!this.isActive) {
        fetch(url, {
          method: "post",
          headers: {
            "Content-Type": "application/json"
          },
          body: JSON.stringify({
            name: this.department
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
      let url = urlDb + '/db_api/departments/' + id;

      fetch(url, {
        method: 'get'
      })
      .then(res => res.json())
      .then(data => {
        const department = document.getElementById("input");

        department.value = data.department.name;
        this.department = data.department.name;
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