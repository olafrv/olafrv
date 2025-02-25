<script setup>
import { Application } from '@splinetool/runtime';
import { ref , onMounted } from 'vue'
import LoadSpinner from '../components/LoadSpinner.vue'

const loading = ref(true);
const showImg = ref(false);
const canvas = ref(null);
const image = ref(null);
const image_src = ref("/img/hw_accel_fix.jpeg");
const url = 'https://prod.spline.design/6KOeVzZFzpWkosQo/scene.splinecode';

onMounted(()=>{
    const app = new Application(canvas.value);
    let webgl = false;
    for (const context of ['webgl2', 'webgl', 'experimental-webgl', 'moz-webgl', 'webkit-3d']) {
        try {
            canvas.value.getContext(context);
            webgl = true;
            break;
        } catch (e) {
            continue;
        }
    }
    webgl = false;
    if (!webgl) {
        console.log("WebGL not supported");
        showImg.value = true;
        loading.value = false;
        
    }else{
        console.log("WebGL supported");
        app.load(url).then(()=>{
            loading.value = false;
        });
    }
})
</script>
<template>
    <v-container class="text-center d-flex flex-column">
        <LoadSpinner v-show="loading"/>
        <div class="text-left" v-if="showImg">
            <v-alert
                icon="mdi-alert"
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
                :src="`${image_src}`" aspect-ratio="16/9" v-show="`!showImg`"/>
            
            </v-alert>
        </div>
        <div v-if="!showImg">
            <canvas ref="canvas" v-show="`!loading`"></canvas>
        </div>
    </v-container>
</template>