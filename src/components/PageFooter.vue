<script setup>
import { ref, onMounted } from 'vue'
const year = new Date().getFullYear();
const icons = ref([
  {src: "/img/vite.svg", width:"20px", url: "https://vitejs.dev/"},
  {src: "/img/vue.svg",width:"20px", url:"https://vuejs.org/"},
  {src: "/img/vuetify.svg",width:"18px", url:"https://vuetifyjs.com/"},
  {src: "/img/spline.png",width:"20px", url:"https://spline.design/"},
  {src: "/img/blender.svg",width:"24px", url:"https://blender.org/"},
])
function onClick(url) {
    window.open(url, '_blank')
}
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Mr+Dafoe&display=swap");

span#a33 {
  font-family: "Mr Dafoe";
  font-size: 1.2em;
  color: white;
  text-shadow: 0 0 0.05em #fff, 0 0 0.2em #fe05e1, 0 0 0.3em #fe05e1;
  transform: rotate(0deg);
}
</style>

<template> 
  <v-footer class="text-center d-flex flex-column bg-transparent">
    <br/>
    <div>
      <v-img
        v-for="icon in icons"
        :key="icon.src" :src="icon.src" :width="icon.width"
        inline @click="onClick(icon.url)"
      ></v-img>
      &nbsp;
      <a href="https://github.com/olafrv/olafrv.github.io" target="_blank">[Source]</a>
    </div>
    <v-divider></v-divider>
    <div>
      {{ year > 2022 ? "@2022 - " : " @" }} {{ year }}
      &nbsp;
      <span id="a33">Olaf Reitmaier</span>
    </div>
    <v-divider></v-divider>
  </v-footer>
</template>
