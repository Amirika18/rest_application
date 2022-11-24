<script setup>
import EditLabel from '../components/editProfiles/EditLabel.vue'
import SaveButton from '../components/editProfiles/SaveButton.vue'
import DeleteButton from '../components/editProfiles/DeleteButton.vue'
import DeleteUserLabel from '../components/editProfiles/DeleteUserLabel.vue'
import Label from '../components/Label.vue'
</script>

<template>
  <div class="common" >
    <EditLabel>
      <template #label>Редактировать проект</template>
    </EditLabel>


    <Label>
      <template #label>Команда</template>
    </Label>
    <DeleteUserLabel v-for="item in this.team" :key="item.id" @delete-user="deleteUser(item.id)">
      <template #name>
        {{ item.name }}
      </template>
      <template #role>
        {{ item.role }}
      </template>
    </DeleteUserLabel>
    <div class="add">
      <container class="select">
        <select v-model="newUser" id="user_input">
          <option v-for="item in this.users" :value="item.id">
            {{ item.name }}
          </option>
        </select>
      </container>
      <container class="select">
        <select v-model="newRole" id="role_input">
          <option v-for="item in this.roles" :value="item.id">
            {{ item.name }}
          </option>
        </select>
      </container>
      <container class="button" @click="addUser">Добавить</container>
    </div>
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
  name: "EditProjectProfileView",
  data() {
    return {
      buttonTextSave: "Сохранить",
      buttonTextDelete: "Удалить",
      name: "",
      end_date: "",
      start_date: "",
      description: "",
      team: [],
      users: [],
      roles: [],
      newUser: "",
      newRole: "",
      deleteUsers: new Set(),
      addUsers: new Set()
    }
  },
  methods: {
    deleteUser(id) {
      let tempArr = [];
      this.team.forEach(user => {
        if (user.id !== id) {
          tempArr.push(user);
        }
        else {
          this.users.push(user);

          if (this.addUsers.has(user.id)) {
            this.addUsers.delete(user.id);
          }
          else {
            if (!this.deleteUsers.has(user.id)) {
              this.deleteUsers.add(user.id);
            }
          }
        }
      })
      this.team = tempArr;
    },
    addUser() {
      const name = document.getElementById("user_input");
      const role = document.getElementById("role_input");

      let idUser = name.value;
      let idRole = role.value;

      if (idUser !== "" && idRole !== "") {
        let isExist = false;
        this.team.forEach(member => {
          if (member.id === idUser) isExist = true;
        })
        if (!isExist) {
          let userName = "";
          let roleName = "";

          this.users.forEach(user => {
            if (user.id === idUser) userName = user.name;
          })
          this.roles.forEach(role => {
            if (role.id === idRole) roleName = role.name;
          })

          this.team.push({
            id: idUser,
            name: userName,
            id_role: idRole,
            role: roleName
          })

          let tempArr = [];
          this.users.forEach(user => {
            if (idUser !== user.id) tempArr.push(user);
          })
          this.users = tempArr;
        }

        if (this.deleteUsers.has(idUser)) {
          this.deleteUsers.delete(idUser);
        }
        else {
          if (!this.addUsers.has(idUser) && !isExist) {
            this.addUsers.add(idUser);
          }
        }
      }
    },
    save() {
      let id = this.getId();
      let url = urlDb + "/db_api/projects/" + id + "/edit";

      fetch(url, {
        method: "post",
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          // body
        })
      });

      this.buttonTextSave = "Загрузка..."
      setTimeout(() => this.$router.go(-1), 1000);
    },
    del() {
      let id = this.getId();
      let url = urlDb + "/db_api/projects/" + id + "/edit";
      let send = confirm("Вы уверены, что хотите удалить проект?");

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
    setData() {

    },
    changeList(users, team) {
      let availableUsers = [];
      users.forEach(user => {
        let check = false;
        team.forEach(member => {
          if (user.id === member.id.substring(1)) check = true;
        })
        if (!check) availableUsers.push(user);
      })
      console.log(users, team)
      return availableUsers
    },
    getData() {
      let id = this.getId();
      let url = urlDb + '/db_api/projects/' + id;

      fetch(url, {
        method: "get"
      })
      .then( res => {
        return res.json()
      })
      .then(data => {
        let items = [];
        this.name = data.project.name;
        this.description = data.project.description;
        this.start_date = "C " + data.project.start;
        if (!data.project.end) {
          this.end_date = "По н.в."
        }
        else {
          this.end_date = "По " + data.project.end;
        }

        data.users.forEach(user => {
          items.push({
            id: "#" + String(user.id).padStart(6, '0'),
            name: user.surname + " " + user.name + " " + user.patronymic,
            id_role: user.id_role,
            role: user.role
          })
        })

        this.team = items;

        let urlUser = urlDb + '/db_api/users';
        fetch(urlUser, {
          method: "get"
        })
        .then( res => {
          return res.json()
        })
        .then(data => {
          let items = [];
          data.forEach(user => {

            items.push({
              id: String(user.id).padStart(6, '0'),
              name: user.surname + " " + user.name + " " + user.patronymic,

            })
          })
          this.users = this.changeList(items, this.team);
        })
      });

      let urlRole = urlDb + '/db_api/project_roles';

      fetch(urlRole, {
        method: "get"
      })
      .then( res => {
        return res.json()
      })
      .then(data => {
        let items = [];
        data.forEach(role => {
          items.push({
            id: String(role.id).padStart(6, '0'),
            name: role.name
          })
        })
        this.roles = items;
      });
    }
  },
  created() {
    this.getData()
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
container {
  margin: 15px;
}
.select {
  width: 100%;
}
.add {
  display: grid;
  grid-template-columns: 4fr 2fr 1fr;
  background: var(--color-gray);
  border-radius: 10px;
}
.button {
  height: 50px;
  background: var(--color-header-background);
  color: var(--color-white);
  font-size: 24px;
  padding: 5px 10px;
  text-align: center;
  border-style: none;
  border-radius: 30px;
  cursor: pointer;
}
#user_input, #role_input {
  margin-left: 10px;
  margin-right: 10px;
}
#user_input {
  width: 95%;
}
#role_input {
  width: 90%;
}
select {
  padding: 10px 10px 10px 0;
  font-size: 24px;
  border-style: none;
  border-radius: 5px;
}
</style>