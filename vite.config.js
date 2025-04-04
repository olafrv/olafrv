import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import vuetify from 'vite-plugin-vuetify'
import { fileURLToPath } from 'url'

export default defineConfig({
  base: "/",
  plugins: [
    vue(),
    vuetify(),
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url)),
    },
  },
  server: {
    warmup: {
      clientFiles: [
        './src/views/HomePage.vue',
      ],
    },
  },
})