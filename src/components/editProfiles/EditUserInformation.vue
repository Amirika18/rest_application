<script>
import urlDb from '../../../params.js';

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
      departments: [],
      department: "",
      positions: [],
      position: ""
    }
  },
  methods: {
    getId() {
      return this.$router.currentRoute._value.fullPath.split('/')[2];
    },
    fillData() {
      let url_dep = urlDb + '/db_api/departments';
      let url_position = urlDb + '/db_api/positions';

      fetch(url_dep, {method: "get"})
      .then( res => {return res.json()})
      .then(data => {
        let items = [];
        data.forEach(department => {
          items.push({
            id: String(department.id).padStart(6, '0'),
            name: department.name
          })
        })
        this.departments = items;
        return items;
      })

      fetch(url_position, {method: "get"})
      .then( res => {return res.json()})
      .then(data => {
        let items = [];
        data.forEach(position => {
          items.push({
            id: String(position.id).padStart(6, '0'),
            name: position.name
          })
        })
        this.positions = items;
        return items;
      })

      let id = this.getId();
      let url = urlDb + '/db_api/users/' + id;
      fetch(url, {method: "get"})
          .then( res => {return res.json()})
          .then(data => {
            this.department = String(data.dep_id).padStart(6, '0');
            this.position = String(data.pos_id).padStart(6, '0');
            return data;
          })
    }
  },
  created() {
    this.fillData();
  }
}
</script>

<template>
  <div class="user">
    <div class="information" id="fio">
      <input id="surname_input" name="surname_input">
      <input id="name_input" name="name_input">
      <input id="patronymic_input" name="patronymic_input">
    </div>
    <div class="information">
      <select v-model="department" id="department_input">
        <option v-for="item in this.departments"
                :value="item.id">
          {{ item.name }}
        </option>
      </select>
    </div>
    <div class="information">
      <select v-model="position" id="position_input">
        <option v-for="item in this.positions"
                :value="item.id">
          {{ item.name }}
        </option>
      </select>
    </div>
  </div>
</template>

<style scoped>
.user {
  display: grid;
  grid-template-rows: 1fr 1fr 1fr;
  min-height: 180px;
  border-radius: 30px;
  border-style: none;
  background: var(--color-gray);
  align-items: center;
  padding: 10px;
}
div {
  font-size: 24px;
  color: var(--color-text);
}
#fio {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  background: var(--color-gray);
  height: 60px;
  padding: 5px;
}
input, select {
  margin: 5px;
  background: var(--color-white);
  border-style: none;
  font-size: 24px;
  border-radius: 5px;
}
input {
  padding:5px;
}
select {
  width: 98%;
  padding: 5px;
  margin: 10px;
}
</style>