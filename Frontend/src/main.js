import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import { createPinia } from 'pinia'
import router from './router'

import CustomTitle from './components/global/CustomTitle.vue'
import BreadCrumb from './components/global/BreadCrumb.vue'

const app = createApp(App)
const pinia = createPinia()

app.component('custom-title', CustomTitle)
app.component('bread-crumb', BreadCrumb)

app.use(pinia)
app.use(vuetify)
app.use(router)
app.mount('#app')
