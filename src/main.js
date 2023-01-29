// Vue
import { createApp } from "vue";
import "./style.css";
import App from "./App.vue";
import router from "./router";
import vuetify from "./vuetify";

const app = createApp(App);
app.use(vuetify).use(router).mount("#app");
