<script setup>
import { Application } from '@splinetool/runtime';
import { ref , onMounted } from 'vue';
import LoadSpinner from '../components/LoadSpinner.vue';
import { mdiAlert } from '@mdi/js';

const loading = ref(true);
const showImg = ref(false);
const canvas = ref(null);
const image = ref(null);
const image_src = ref("/img/hw_accel_fix.jpeg");
const url = 'https://prod.spline.design/6KOeVzZFzpWkosQo/scene.splinecode';

onMounted(async ()=>{
    const app = new Application(canvas.value);
    await app.load(
        url
    ).then(()=>{
        console.log("Loaded Spline scene successfully");
        loading.value = false;
    }).catch((e)=>{
        console.log("Error loading Spline scene", e);
        loading.value = false;
        showImg.value = true;
    });
})
</script>
<template>
    <v-container class="text-center d-flex flex-column">
        <LoadSpinner v-show="loading"/>
        <div class="text-left" v-if="showImg">
            <v-alert
                :icon="mdiAlert"
                color="info"
                title="Browser without WebGL support"
                text=""
            >
            <br>
            The content of this section requires WebGL support to be displayed.
            <br>
            Go to Settings → System → Enable Hardware Acceleration.
            <br>
            <br>
            <v-img ref="image"
                :height="`400`"
                :src="`${image_src}`" aspect-ratio="16/9"/>
            
            </v-alert>
        </div>
        <div v-if="!showImg">
            <canvas ref="canvas" v-show="`!loading`"></canvas>
        </div>
    </v-container>
</template>