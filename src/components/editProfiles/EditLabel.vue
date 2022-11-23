<template>
  <div class="label">
    <div class="icon" @click="backView">
      🠨
    </div>
    <div>
      <slot name="label"></slot>
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    backView() {
      this.$router.back();
    }
  }
}
</script>

<style scoped>
.label {
  background: var(--color-header-background);
  color: var(--color-white);
  align-items: center;
  text-align: center;
  padding: 10px;
  height: 60px;
  min-width: 340px;
  border-radius: 30px;
  font-size: 24px;
  display: grid;
  grid-template-columns: 1fr 20fr 1fr;
}
.icon {
  font-size: 24px;
  height: 40px;
  width: 40px;
  color: var(--color-black);
  background: var(--color-gray);
  border-style: none;
  border-radius: 20px;
}
.icon:hover {
  cursor: pointer;
}
</style>