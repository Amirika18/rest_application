<template>
  <div class="skill">
    <div class="information" id="fio">
      <input id="skill_input" name="skill_input">
    </div>
    <div class="information">
      <textarea id="description_input" name="description_input"></textarea>
    </div>
  </div>
</template>

<script>
export default {
  name: "EditSkillInformation"
}
</script>

<style scoped>
.skill {
  border-radius: 30px;
  border-style: none;
  background: var(--color-gray);
  align-items: center;
  display: flex;
  flex-direction: column;
  padding: 15px 15px 5px;
}
div {
  font-size: 24px;
  color: var(--color-text);
}
input, textarea{
  margin: 5px 0;
  background: var(--color-white);
  border-style: none;
  font-size: 24px;
  border-radius: 5px;
  padding:5px;
  width: 100%;
  box-sizing: border-box;
}
.information {
  width: 100%;
  box-sizing: border-box;
}
#description_input {
  resize: vertical;
}
</style>