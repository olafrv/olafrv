<script setup>
import { ref, onBeforeMount } from 'vue';
import { useRoute } from 'vue-router';
import axios from 'axios';
import { mdiAlert, mdiChevronLeft, mdiChevronRight, mdiDownload } from '@mdi/js';
import VuePdfEmbed from 'vue-pdf-embed';

const route = useRoute();
const id = ref(route.query.id);
const error = ref(false);
const visible = ref(false);
const article = ref(null);
const currentPage = ref(1);
const pageCount = ref(0);

onBeforeMount(() => {
  const file = '/blog/articles.json';
  axios.get(file).then(function (response) {
    article.value = response.data.find((item) => item.id + '' === id.value);
    if (article.value != null) {
      visible.value = true;
    } else {
      error.value = true;
    }
  });
});

function onLoaded(pdf) {
  pageCount.value = pdf.numPages;
}
</script>

<template>
  <v-container>
    <v-col>
      <v-row v-if="error" class="text-center d-flex flex-column">
        <br />
        <v-alert
          :icon="mdiAlert"
          color="info"
          title="Article moved or not found"
          text=""
        >
          Please check the list <router-link to="/articles">here</router-link> (Article ID:
          '{{ id }}').
        </v-alert>
      </v-row>

      <v-row v-if="visible" class="text-center d-flex flex-column">
        <h2>{{ article.title }}</h2>
        <br />
      </v-row>

      <v-row v-if="visible" class="d-flex flex-column align-center">
        <VuePdfEmbed
          :source="article.pdf_url"
          :page="currentPage"
          @loaded="onLoaded"
          style="max-width: 900px; width: 100%;"
        />
        <v-row class="mt-2 align-center justify-center ga-2">
          <v-btn
            :icon="mdiChevronLeft"
            :disabled="currentPage <= 1"
            variant="text"
            @click="currentPage--"
          />
          <span>{{ currentPage }} / {{ pageCount }}</span>
          <v-btn
            :icon="mdiChevronRight"
            :disabled="currentPage >= pageCount"
            variant="text"
            @click="currentPage++"
          />
          <v-btn
            :icon="mdiDownload"
            variant="text"
            :href="article.pdf_url"
            target="_blank"
            title="Download PDF"
          />
        </v-row>
      </v-row>

      <v-row v-if="visible" class="text-center d-flex flex-column mt-4">
        <span style="font-size: 10px;">
          <b>DISCLAIMER:</b> All the content of this website is informative and non-commercial,
          does not imply a commitment to develop, launch or schedule delivery of any feature or
          functionality, should not rely on it in making decisions, incorporate or take it as a
          reference in a contract or academic matters. Likewise, the use, distribution and
          reproduction by any means, in whole or in part, without the authorization of the author
          and / or third-party copyright holders, as applicable, is prohibited.
        </span>
      </v-row>
    </v-col>
  </v-container>
</template>
