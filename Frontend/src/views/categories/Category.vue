<script>
import { mapActions, mapState } from "pinia";
import { useCategoryStore } from "@/stores/category";

export default {
  data() {
    return {
      selected: [],
      dialog: false,
      headers: [
        { title: "#ID", key: "id", width: "2px" },
        { title: "Profile", key: "profile" },
        { title: "First Name", key: "first_name" },
        { title: "Last Name", key: "last_name" },
        { title: "Email", key: "email" },
        { title: "Deleted at", key: "deleted_at" },
        { title: "", key: "actions", width: "16%", sortable: false },
      ],
    };
  },
  created() {
    this.getCategories();
  },
  computed: {
    ...mapState(useCategoryStore, ["categories"]),
  },
  methods: {
    ...mapActions(useCategoryStore, ["getCategories"]),
  },
};
</script>
<template>
  <custom-title icon="mdi-tag-outline"
    >Gategories Management List
    <template #right>
      <v-btn @click="dialog = !dialog"> Open Dialog </v-btn>
    </template>
  </custom-title>
  <v-data-table
    v-model="selected"
    :items="categories"
    item-value="name"
    show-select
  ></v-data-table>
</template>
<style scoped></style>
