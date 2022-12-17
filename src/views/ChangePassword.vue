<template>
  <div class="change">
    <div class="form">
      <div id="label">Сменить пароль</div>
      <input id="password_old" type="password" placeholder="Old password" v-if="!this.isRecovery">
      <input id="password" type="password" placeholder="New password">
      <button type="submit" id="button" @click="changePassword">Подтвердить</button>
    </div>
  </div>

</template>

<script>
export default {
  name: "ChangePassword",
  methods: {
    changePassword() {
      if (this.isRecovery) {
        const path = this.$router.currentRoute._value.fullPath.split("/");
        const id = path[path.length - 2];
        const tag = path[path.length - 1];

        console.log(id, tag, this.isRecovery, "2222")
        // recover password
      }
      else {
        // change password
      }
    }
  },
  data() {
    return {
      isRecovery: false
    }
  },
  created() {
    if (this.$router.currentRoute._value.fullPath.includes("recovery")) {
      this.isRecovery = true;
    }
    else if (this.$router.currentRoute._value.fullPath.includes("change")) {
      this.isRecovery = false;
    }
  }
}
</script>

<style scoped>
.change {
  margin-top: 50px;
  font-size: 24px;
  padding: 20px;

  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
}
.form {
  width: max-content;
  border-radius: 30px;
  padding: 20px;
  background: var(--color-gray);

  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
  text-align: center;
}
#label, #button, #password_old, #password{
  margin: 10px 20px;
  font-size: 24px;
}
</style>