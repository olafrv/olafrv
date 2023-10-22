<template>
<!--
    <v-container class="d-lg-flex align-center justify-center">
        <v-img cover src="/img/ovni.png" />
    </v-container>
-->
    <v-container class="d-lg-flex align-center justify-center">
        <canvas ref="canvas"></canvas>
    </v-container>
</template>
<script setup>
import { Application } from '@splinetool/runtime';
import { ref , onMounted } from 'vue'
const canvas = ref(null)
onMounted(()=>{
    const app = new Application(canvas.value);
    app.load('https://prod.spline.design/6KOeVzZFzpWkosQo/scene.splinecode?t=' + Math.random());
})
</script>