<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';
import { useSnackStore } from '@/stores/SnackBar';
import { 
   mdiHomeCity, mdiLinkedin, mdiGithub, 
   mdiPaperclip, mdiTrafficLight, mdiChevronLeft
} from '@mdi/js';
 
const drawer = ref(true);
const rail = ref(true);
const items = ref([
  { title: 'Home', icon: mdiHomeCity, path: '/' },
  { title: 'Resume', icon: mdiLinkedin, path: 'https://www.linkedin.com/in/olafrv' },
  { title: 'Projects', icon: mdiGithub, path: 'https://github.com/olafrv' },
  { title: 'Articles', icon: mdiPaperclip, path: '/articles' },
  { title: 'Status', icon: mdiTrafficLight, path: 'https://status.olafrv.com/' },
]);
const router = useRouter();
const store = useSnackStore()
const { setVisible, setText } = store

function onClick(item) {
  if (item.path.startsWith('http')){
    setText("Opened new tab to: " + item.path)
    setVisible(true)
    window.open(item.path, '_blank')
    return false
  }else{
    router.push({ path: item.path });
  }
}
</script>

<template>
  <v-navigation-drawer
    v-model="drawer"
    :rail="rail"
    permanent
    @click="rail = false"
  >
    <v-list nav density="compact">
      <v-list-item nav>
        <template v-slot:prepend>
          <v-avatar
            image="https://avatars.githubusercontent.com/u/987499?s=48&v=4"
            size="32"
          ></v-avatar>
          &nbsp;&nbsp;&nbsp;Olaf Reitmaier
        </template>
        <template v-slot:append>
          <v-btn
            variant="text"
            :icon="mdiChevronLeft"
            @click.stop="rail = !rail"
          ></v-btn>
        </template>
      </v-list-item>
    </v-list>
    <v-divider></v-divider>
    <v-list nav density="compact">
      <v-list-item
        nav
        :prepend-icon="item.icon"
        :title="item.title"
        :value="item.path"
        v-for="item in items"
        :key="item.title"
        @click="onClick(item)"
      ></v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>
