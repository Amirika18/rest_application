<script setup>
import EditLabel from '../components/EditLabel.vue'
import PositionLabelView from '../components/positionProfile/PositionLabelView.vue'
import Label from '../components/Label.vue'
</script>

<template>
  <div>
    <EditLabel>
      <template #label>
        Страница должности
      </template>
    </EditLabel>
    <PositionLabelView>
      <template #position>{{ this.name }}</template>
    </PositionLabelView>
    <Label>
      <template #label>
        Сотрудники
      </template>
    </Label>
  </div>
</template>

<script>
export default {
  data(){
    return {
      name: "default"
    }
  },
  name: "ViewPositionProfileView",
  methods: {
    getId() {
      let id = this.$router.currentRoute._value.fullPath.split('/')[2];
      this.id = "#" + id;
      return id
    },
    getPosition() {
      // request
    }
  },
  created() {
    this.getId();
    this.getPosition();
  }
}
</script>

<style scoped>
div {
  margin: 20px;
}
</style>