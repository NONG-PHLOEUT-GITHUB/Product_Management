<script>
  import Loading from './components/global/Loading.vue'
  import Notif from '@/components/global/Notification.vue'
  import Confirm from '@/components/global/Confirm.vue'

  export default {
    name: 'App',
    components: {
      Loading,
      Notif,
      Confirm
    },
    data() {
      return {}
    },
    mounted() {
      this.$root.$confirm = this.$refs.confirm.open
      this.$root.$notif = this.$refs.notif.newAlert
      if (import.meta.env.VITE_APP_MODE !== 'DEV') {
        const preventContextMenu = event => {
          event.preventDefault()
        }
        document.addEventListener('contextmenu', preventContextMenu)

        document.addEventListener('keydown', event => {
          if (
            event.key === 'F12' ||
            (event.ctrlKey && event.shiftKey && event.key === 'I')
          ) {
            event.preventDefault()
          }
        })
      }
    }
  }
</script>

<template>
  <v-app>
    <loading />
    <notif ref="notif" dismissible :default-timeout="2000" />
    <confirm ref="confirm" />
    <router-view />
  </v-app>
</template>

<style scoped>
  .logo {
    height: 6em;
    padding: 1.5em;
    will-change: filter;
    transition: filter 300ms;
  }
  .logo:hover {
    filter: drop-shadow(0 0 2em #646cffaa);
  }
  .logo.vue:hover {
    filter: drop-shadow(0 0 2em #42b883aa);
  }
</style>
