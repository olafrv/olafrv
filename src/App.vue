<script setup>
  import { ref } from 'vue'
  import TopBar from './components/TopBar.vue'
  import LeftBar from './components/LeftBar.vue'
  import PageFooter from './components/PageFooter.vue'
  import SnackBar from './components/SnackBar.vue'
  
  const theme = ref('dark')
  function setTheme() {
    theme.value = theme.value === 'light' ? 'dark' : 'light'
  }
</script>

<template>
  <v-app :theme="theme">
    <v-layout>
      <LeftBar />
      <TopBar @themeChanged="setTheme()" :theme="theme" />
      <SnackBar />
      <v-main>
        <router-view />
        <PageFooter />
      </v-main>
    </v-layout>
  </v-app>
</template>