<template>
    <name-id-element id="111" text="text"/>
</template>

<script>
import NameIdElement from "./nameIdElement.vue";
export default {
  name: "ContentHolder",
  components: {NameIdElement},
  data() {
    return {
      // parentMessage: 'Parent',
      items: [{ id: '#1111' , text: 'foo'}, { id: '#1112' , text: 'foos'}]
    }
  }
}
</script>

<style scoped>

</style>