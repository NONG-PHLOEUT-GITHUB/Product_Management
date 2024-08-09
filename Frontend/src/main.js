import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import { createPinia } from 'pinia'
import router from "./router"

import CustomTitle from './components/global/CustomTitle.vue'

const app = createApp(App)
const pinia = createPinia()

app.component('custom-title', CustomTitle)

app.use(pinia)
app.use(vuetify)
app.use(router)
app.mount('#app')
