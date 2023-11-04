<script setup>
import { ref , onMounted } from 'vue'
import { useRoute } from 'vue-router'
import MarkdownIt from 'markdown-it'
import metadata_block from 'markdown-it-metadata-block'
import yaml from 'yaml'
import axios from 'axios'

const error = ref(false)
const mdHtml = ref("")
const mdMeta = ref({})
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
                    meta: mdMeta.value
                }
            )
            mdHtml.value = mdi.render(response.data)
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
        <v-col>
            <v-row v-if="error">
                <v-icon 
                    color="warning"
                    icon="mdi-alert" 
                    size="large"
                />
                Article '{{ articleName }}' not found.
            </v-row>
            <v-row v-if="!error" class="text-center">
                <h1 v-html="mdMeta.title"></h1>
            </v-row>
            <v-row>
                <div v-html="mdHtml"></div>
            </v-row>
        </v-col>
    </v-container>
</template>
