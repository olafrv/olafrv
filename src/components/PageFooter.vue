<script setup>
const year = new Date().getFullYear();
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Mr+Dafoe&display=swap");

span#a33 {
  font-family: "Mr Dafoe";
  font-size: 2.5em;
  color: white;
  text-shadow: 0 0 0.05em #fff, 0 0 0.2em #fe05e1, 0 0 0.3em #fe05e1;
  transform: rotate(0deg);
}
</style>

<template>
  <v-footer>
    <v-container>
      <v-row class="d-sm-flex">
        <v-col class="d-sm-flex align-center justify-center">
          Made with:&nbsp;
          <a href="https://vitejs.dev/" target="_blank">
            <v-img width="25px" src="/img/vite.svg" /> </a
          >&nbsp;
          <a href="https://vuejs.org/" target="_blank">
            <v-img width="25px" src="/img/vue.svg" /> </a
          >&nbsp;
          <a href="https://vuetifyjs.com/" target="_blank">
            <v-img width="25px" cover src="/img/vuetify.svg" /> </a
          >&nbsp;
          <a href="https://spline.design/" target="_blank">
            <v-img width="25px" cover src="/img/spline.png" /> </a
          >&nbsp; {{ year > 2023 ? "@2023 - " : " @" }} {{ year }}
          &nbsp;&nbsp;&nbsp;
          <span class="d-sm-flex-inline" id="a33">Olaf Reitmaier</span>
        </v-col>
      </v-row>
    </v-container>
  </v-footer>
</template>
