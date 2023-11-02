<script setup>
import { Application } from '@splinetool/runtime';
import { ref , onMounted } from 'vue'
import LoadSpinner from '../components/LoadSpinner.vue'
import { useRoute, useRouter } from 'vue-router'

const loading = ref(true);
const canvas = ref(null)
const route = useRoute();
const router = useRouter();

onMounted(()=>{
    if (route.query.article) {  // github trick
        router.push({ path: '/article', query: { name: route.query.name } });
        return;
    }else{
        const app = new Application(canvas.value);
        const url = 'https://prod.spline.design/6KOeVzZFzpWkosQo/scene.splinecode?t=' + Math.random();
        app.load(url).then(()=>{
            loading.value = false;
        });
    }
})
</script>
<template>
    <v-container class="text-center d-flex flex-column">
        <LoadSpinner v-show="loading"/>
        <canvas ref="canvas" v-show="`!loading`"></canvas>
    </v-container>
</template>