import Vue from "vue";
import App from "./App.vue";
import VueI18n from "vue-i18n";
import BootstrapVue from "bootstrap-vue";
import "bootstrap/dist/css/bootstrap.css";
import "bootstrap-vue/dist/bootstrap-vue.css";

Vue.use(BootstrapVue);

Vue.use(VueI18n);
Vue.config.productionTip = false;

const messages = require("./data/locales.json");

const isBrowserLangExistent = ["de", "en", "it"].includes(
  navigator.language.substr(0, navigator.language.indexOf("-"))
);

const i18n = new VueI18n({
  locale: isBrowserLangExistent
    ? navigator.language.substr(0, navigator.language.indexOf("-"))
    : "en",
  messages
});

new Vue({
  i18n,
  render: h => h(App)
}).$mount("#app");
