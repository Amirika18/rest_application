<script setup>
import Label from '../components/Label.vue'
import InputNewPosition from '../components/InputNewPosition.vue'
import PositionLabel from '../components/PositionLabel.vue'
</script>

<script>
import urlDb from '../../params.js';

export default {
  data() {
    return {
      responseData: []
    }
  },
  methods: {
    link(id, name) {
      let url = '/view_position/' + id.substring(1);
      this.$router.push({path: url, param: {id: id, position: name}});
    },
    getData() {
      let url = urlDb + '/db_api/positions';

      fetch(url, {
        method: "get"
      })
      .then( res => {
        return res.json()
      })
      .then(data => {
        let items = [];
        data.forEach(position => {
          items.push({
            id: "#" + String(position.id).padStart(6, '0'),
            name: position.name
          })
        })
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
    <Label>
      <template #label>
        Должности
      </template>
    </Label>
    <InputNewPosition />
    <container>
      <PositionLabel v-for="item in this.responseData"
                        :key="item.id"
                        @click="link(item.id, item.name)">
        <template #position>
          {{ item.name }}
        </template>
        <template #id>
          {{ item.id }}
        </template>
      </PositionLabel>
    </container>
  </div>
</template>

<style scoped>
div {
  margin: 20px;
}
</style>