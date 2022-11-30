<template>
  <div id="information">
    <div>
      <slot name="project_name"></slot>
    </div>
    <div>
      <slot name="role"></slot>
    </div>
  </div>
</template>

<style>
#information {
  display: grid;
  grid-template-columns: 3fr 1fr;
  margin: 5px 20px;
}

</style>
