import '@mdi/font/css/materialdesignicons.css'
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import { en, km } from 'vuetify/locale'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'
import * as labs from 'vuetify/labs/components'
import { VDateInput } from 'vuetify/labs/VDateInput'
import { VCalendar } from 'vuetify/labs/VCalendar'

const vuetify = createVuetify({
  components: {
    VDateInput,
    VCalendar,
    ...components,
    ...labs
  },
  directives,
  theme: {
    defaultTheme: 'light',
    themes: {
      light: {
        dark: false,
        colors: {
          primary: '#092541',
          secondary: '#c17290',
          textField: '#2f9dab',
          btnEdit: '#a0627f',
          background: '#f8f7f8',
          warning: '#FB8C00',
          error: '#B00020',
          info: '#2196F3',
          surface: '#FFFFFF',
          charm:'#d294ad'
        }
      },
      dark: {
        colors: {
          primary: '#af1713',
          secondary: '#c17290',
          background: '#000000',
          warning: '#ffc107'
        }
      }
    }
  },
  locale: {
    messages: { en, km }, // Locale messages
    locale: 'en', // Default locale
    fallback: 'km' // Fallback locale
  },
  icons: {
    defaultSet: 'mdi'
  },
  date: {
    locale: {
      en: 'en-GB'
    }
  }
})

export default vuetify
