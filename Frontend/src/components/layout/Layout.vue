<template>
  <!-- <v-layout class="rounded rounded-md"> -->
    <!-- app bar -->
    <sidebar v-model="drawer" />
    <app-bar @toggle="toggleNav" />

    <v-main>
      <v-container fluid>
        <router-view />
      </v-container>
    </v-main>
  <!-- </v-layout> -->
</template>
<script>
import AppBar from "./AppBar.vue";
import Sidebar from "./Sidebar.vue";
export default {
  components: {
    AppBar,
    Sidebar,
  },
  data: () => ({
    drawer: true,
  }),
  computed: {

  },
  methods: {
    toggleNav() {
      this.drawer = !this.drawer;
    },
  },
};
</script>
