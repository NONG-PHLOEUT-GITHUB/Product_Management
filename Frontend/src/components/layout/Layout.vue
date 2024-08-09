<template>
  <v-layout class="rounded rounded-md">
    <v-navigation-drawer>
      <template v-slot:prepend>
        <v-list>
          <v-list-item>
            <v-img
              class="image"
              rounded
              src="/assets/logo.png"
              rounded-sm
            ></v-img>
          </v-list-item>
        </v-list>
      </template>
      <v-list
        v-model:opened="open"
        v-for="(link, i) in menus"
        :key="link.title"
        dense
        class="pa-0"
      >
        <v-list-item
          v-if="!link.subLinks"
          :key="i"
          :to="link.path"
          class="v-list-item"
          exact
        >
          <template v-slot:prepend>
            <v-icon :icon="link.icon"></v-icon>
          </template>
          <v-list-item-title>
            {{ link.title }}
          </v-list-item-title>
        </v-list-item>

        <v-list-group v-else :key="link.title" no-action class="pa-0">
          <template v-slot:activator="{ props }">
            <v-list-item v-bind="props">
              <template v-slot:prepend>
                <v-icon :icon="link.icon"></v-icon>
              </template>
              <v-list-item-title class="text-uppercase back-title">
                {{ link.title }}
              </v-list-item-title>
            </v-list-item>
          </template>

          <v-list-item
            v-for="sublink in link.subLinks"
            :to="sublink.path"
            :key="sublink.title"
            exact
          >
            <template v-slot:prepend>
              <v-icon :icon="sublink.icon"></v-icon>
            </template>
            <v-list-item-title>
              {{ sublink.title }}
            </v-list-item-title>
          </v-list-item>
        </v-list-group>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar title="Product Management">
      <template v-slot:append>
        <v-avartar></v-avartar>
      </template>
    </v-app-bar>

    <v-main>
      <v-container>
        <router-view />
      </v-container>
    </v-main>
  </v-layout>
</template>
<script>
export default {
  data: () => ({
    open: ["Examination"],
  }),
  computed: {
    menus() {
      return [
        {
          path: "/dashboard",
          title: "Dashboard",
          icon: "mdi-view-dashboard-outline",
        },
        {
          path: "/gategories",
          title: "Gategories",
          icon: "mdi-tag-outline",
        },
        {
          path: "/suppliers",
          title: "Suppliers",
          icon: "mdi-truck-fast",
        },
        {
          path: "/products",
          title: "Products",
          icon: "mdi-package-variant",
        },
      ];
    },
  },
};
</script>
