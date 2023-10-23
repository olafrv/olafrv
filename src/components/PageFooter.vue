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
      <v-row>
        <v-col class="text-body-2 text-center align-center">
          Made with:&nbsp;
          <a href="https://vitejs.dev/" target="_blank">
            <v-img inline width="25px" src="/img/vite.svg"
              :aspect-ratio="1"
            ></v-img>
          </a>&nbsp;
          <a href="https://vuejs.org/" target="_blank">
            <v-img inline width="25px" src="/img/vue.svg"
              :aspect-ratio="1"
            ></v-img>
          </a>&nbsp;
          <a href="https://vuetifyjs.com/" target="_blank">
            <v-img inline width="25px" 
            :aspect-ratio="1" src="/img/vuetify.svg"
            ></v-img>
          </a>&nbsp;
          <a href="https://spline.design/" target="_blank">
            <v-img inline width="25px" 
              :aspect-ratio="1" src="/img/spline.png"
            ></v-img>
          </a>
        </v-col>
      </v-row>
      <v-row>
        <v-col class="text-body-2 text-center align-center">
          {{ year > 2023 ? "@2023 - " : " @" }} {{ year }}
          &nbsp;&nbsp;&nbsp;
          <span id="a33" style="font-size: x-large;">Olaf Reitmaier</span>
        </v-col>
      </v-row>
    </v-container>
  </v-footer>
</template>
