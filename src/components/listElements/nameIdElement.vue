<template>
  <div class="element">
    <slot />
  </div>
</template>

<script>
export default {
  name: "nameIdElement"
}
</script>

<style scoped>
  .element{
    background-color: lightblue;
    display: flex;
    justify-content: space-between;
    height: 60px;
    max-width: 900px;
  }
  .name{

  }
  .id{

  }
</style>