<script setup>
import { ref , onMounted } from 'vue'
import { useRouter } from 'vue-router';
import axios from 'axios';

const articles = ref([]);
onMounted(()=>{
    const file = '/blog/articles.json'
    axios.get(file).then(function (response){
        var data = response.data
        data.forEach(function(element, index){
            data[index].title = 
                element.mdfile
                .replace(".md","")
                .replaceAll("-"," ")
                .replace(/\b\w/g, l => l.toUpperCase())
                // .replace(/\d+\s/, '')
        });
        articles.value = data;
    })
})
const router = useRouter();
function onClick(articleMdFile) {
    // GitHub Trick
    router.push({
        path: '/',
        query: { 
            article: 'redirect',
            name: articleMdFile.replace(".md","") 
        }
    });
    /* 
    // Normal - Current Tab
    router.push({
        path: 'article',
        query: { name: articleMdFile.replace(".md","") }
    });
    */
    /*
    // Normal - New Tab
    const resolvedRoute = router.resolve({
        path: 'article',
        query: { name: articleMdFile.replace(".md","") }
    })
    window.open(resolvedRoute.href, '_blank')
    */
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
                            <v-img :src="`/blog/img/${item.imgfile}`"></v-img>
                        </v-avatar>
                        &nbsp;
                        <a @click="onClick(item.mdfile)">{{ item.title }}</a>
                        </span>
                    </template>
                </v-card>
            </template>
        </v-virtual-scroll>
    </v-container>
</template>