<script setup>
import { mdiWeatherSunny, mdiWeatherNight } from '@mdi/js';

const props = defineProps(["theme"]);
const emit = defineEmits(["themeChanged"]);
let icon = mdiWeatherSunny;
function themeChanged() {
  icon = props.theme === 'light' ? mdiWeatherSunny : mdiWeatherNight;
  emit('themeChanged');
}
</script>

<template>
  <v-app-bar>
    <v-spacer></v-spacer>
    <span style="padding: 10px">
      <v-icon :icon="icon" @click="themeChanged()"/>
    </span>
  </v-app-bar>
</template>