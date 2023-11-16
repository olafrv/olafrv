<script setup>
import { ref , onMounted } from 'vue'
import { useRouter } from 'vue-router';
import axios from 'axios';

const articles = ref([]);
onMounted(()=>{
    const file = '/blog/articles.json'
    axios.get(file).then(function (response){
        articles.value = response.data.reverse();
    })
})
const router = useRouter();
function onClick(id) {
    const resolvedRoute = router.resolve({
        path: 'article',
        query: { id: id }
    })
    window.open(resolvedRoute.href, '_blank')
}
</script>
<template>
    <v-container>
        <v-virtual-scroll
        :height="600"
        :items="articles"
        >
            <template v-slot:default="{ item }">
                <v-card>
                    <template v-slot:title>
                        <span class="text-wrap">
                        <v-avatar>
                            <v-img :src="`/blog/img/${item.img}`"></v-img>
                        </v-avatar>
                        &nbsp;
                        <a @click="onClick(item.id)">{{ item.title }}</a>
                        </span>
                    </template>
                </v-card>
            </template>
        </v-virtual-scroll>
    </v-container>
</template>