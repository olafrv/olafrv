<script setup>
import { ref , onBeforeMount } from 'vue';
import { useRoute } from 'vue-router';
import axios from 'axios';
import { mdiAlert } from '@mdi/js';

const route = useRoute()
const id = ref(route.query.id)
const error = ref(false)
const visible = ref(false)
const article = ref(null)

onBeforeMount(() => {
    const file = '/blog/articles.json'
    axios.get(file).then(function (response){
        article.value = response.data.find((item) => item.id + "" === id.value)
        if (article.value != null) {
            visible.value = true
        }else{
            error.value = true
        }
        console.log(article.value)
    })
})
</script>

<style scoped>
:deep(iframe) { all: revert; }
</style>

<template>
    <v-container>
        <v-col>
            <v-row v-if="error" class="text-center d-flex flex-column">
                <br>
                <v-alert
                    :icon="mdiAlert"
                    color="info"
                    title="Article moved or not found"
                    text=""
                >
                Please check the list <router-link to="/articles">here</router-link> (Article ID: '{{ id }}').
                </v-alert>                
            </v-row>
            <v-row v-if="visible" class="text-center d-flex flex-column">
                <h2>{{ article.title }}</h2>
                <br>
            </v-row>
            <v-row v-if="visible" class="text-center d-flex flex-column">
                <div>
                    <iframe
                        :src="article.embed_url" 
                        :width="article.width" 
                        :height="article.height" 
                        frameborder="0" 
                        marginwidth="0" 
                        marginheight="0" 
                        scrolling="no" 
                        allow="fullscreen">
                    </iframe>
                    <br>
                    <a :href="article.url" target="_blank">Download PDF</a>
                </div>
            </v-row>
            <v-row v-if="visible" class="text-center d-flex flex-column">
                <br>
                <span style="font-size: 10px;">
                    <b>DISCLAIMER:</b> All the content of this website is informative and non-commercial, 
                    does not imply a commitment to develop, launch or schedule delivery 
                    of any feature or functionality, should not rely on it in making decisions, 
                    incorporate or take it as a reference in a contract or academic matters. 
                    Likewise, the use, distribution and reproduction by any means, 
                    in whole or in part, without the authorization of the author 
                    and / or third-party copyright holders, as applicable, is prohibited.
                </span>
            </v-row>
        </v-col>
    </v-container>
</template>
