<script setup>
import { ref , onMounted } from 'vue'
import { useRoute } from 'vue-router'
import MarkdownIt from 'markdown-it'
import metadata_block from 'markdown-it-metadata-block'
import yaml from 'yaml'
import axios from 'axios'

const error = ref(true)
const tHtml = ref("")
const tMeta = ref({})
const meta = ref({})  // do not rename
const route = useRoute()
const articleName = ref(route.query.name)
const fileUrl = '/blog/md/' + articleName.value + '.md'

onMounted(()=>{
    axios.get(fileUrl)
        .then((response)=>{
            const mdi = new MarkdownIt({
                html: true,
                linkify: true,
                breaks: true,
                xhtmlOut: true
            }).use(
                metadata_block,
                {
                    parseMetadata: yaml.parse,
                    meta
                }
            )
            tMeta.value = meta
            tHtml.value = mdi.render(response.data)
            error.value = false
        }).catch((reason)=>{
            error.value = true
        })
})
</script>
<style scoped>
:deep(*) {
    all: revert;
}
</style>
<template>
    <v-container>
        <v-col v-if="error==false">
            <v-row class="text-center">
                <h1>{{ tMeta.title }}</h1>
            </v-row>
            <v-row>
                <div v-html="tHtml"></div>
            </v-row>
        </v-col>
        <span v-else>
            <v-icon 
                color="warning"
                icon="mdi-alert" 
                size="large"
            />
            Article '{{ articleName }}' not found.
        </span>
    </v-container>
</template>
