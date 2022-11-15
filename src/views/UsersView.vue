<!--/ussers-->
<template>
  <div>
  <HighLabel>
    <template #label>
      Сотрудники
    </template>
  </HighLabel>
  <InputNewUser />
  </div>
  <ContentHolder>

  </ContentHolder>
</template>

<script>
import ContentHolder from "../components/listElements/ContentHolder.vue";
export default {
  name: "UsersView",
  components: {InputNewUser, ContentHolder}
}
import HighLabel from '../components/HighLabel.vue'
import InputNewUser from '../components/InputNewUser.vue'

</script>

<style scoped>
div {
  margin: 20px;
}
</style>