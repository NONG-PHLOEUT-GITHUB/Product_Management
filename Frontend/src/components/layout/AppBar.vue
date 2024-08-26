<template>
  <v-app-bar :elevation="2">
    <template v-slot:prepend>
      <v-app-bar-nav-icon @click="togglerDrawer"></v-app-bar-nav-icon>
    </template>

    <v-app-bar-title>Poroduct Management</v-app-bar-title>

    <template v-slot:append>
      <!-- <v-btn icon="mdi-heart"></v-btn>

      <v-btn icon="mdi-magnify"></v-btn>
 
      <v-btn icon="mdi-dots-vertical"></v-btn> -->
      <v-menu v-model="menu">
        <template v-slot:activator="{ props }">
          <v-list width="260px">
            <v-list-item
              prepend-avatar="https://cdn.vuetifyjs.com/images/john.png"
              title="John Leider"
              subtitle="john@google.com"
            >
              <template v-slot:append>
                <v-btn
                  v-bind="props"
                  :icon="menu ? 'mdi-menu-up' : 'mdi-menu-down'"
                  size="small"
                  variant="text"
                ></v-btn>
              </template>
            </v-list-item>
          </v-list>
        </template>

        <v-divider></v-divider>

        <v-list :lines="false" width="230" rounded="lg">
          <v-list-item
            v-for="(item, i) in items"
            :key="i"
            :value="item"
            color="primary"
            :to="item.path"
          >
            <template v-slot:prepend>
              <v-icon :icon="item.icon"></v-icon>
            </template>

            <v-list-item-title v-text="item.text"></v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>
    </template>
  </v-app-bar>
</template>
<script>
export default {
  emits: ['toggle'],
  data: () => ({
    menu: false,
    items: [
      { text: "Profile", icon: "mdi-account", path: "/account" },
      { text: "Setting", icon: "mdi-cog" ,path:'/general/settings'},
      { text: "Starred", icon: "mdi-star" },
      { text: "Recent", icon: "mdi-history" },
      { text: "Offline", icon: "mdi-check-circle" },
      { text: "Uploads", icon: "mdi-upload" },
      { text: "Logout", icon: "mdi-logout" },
    ],
  }),
  methods: {
    togglerDrawer() {
      this.$emit("toggle");
    },
  },
};
</script>
