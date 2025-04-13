import "vuetify/styles";
import { createVuetify } from "vuetify";

// https://vuetifyjs.com/en/features/icon-fonts/#mdi-css
// import "@mdi/font/css/materialdesignicons.css"; // development
// import "@mdi/font/css/materialdesignicons.min.css"; // development (minimized)
// import { aliases, mdi } from "vuetify/iconsets/mdi"; // development

// https://vuetifyjs.com/en/features/icon-fonts/#mdi-js-svg
import { aliases, mdi } from 'vuetify/iconsets/mdi-svg'; // production (optimal)

import { md2 } from "vuetify/blueprints";
import { mdiAccount } from "@mdi/js";

export default createVuetify({
  theme: {
    defaultTheme: "dark",
  },
  blueprint: md2,
  icons: {
    defaultSet: "mdi",
    aliases,
    sets: {
      mdi,
    },
  },
});