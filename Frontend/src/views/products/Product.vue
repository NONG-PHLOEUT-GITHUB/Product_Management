<script>
import { mapActions, mapState } from "pinia";
import { useProductStore } from "@/stores/product";

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
    this.getProducts();
  },
  computed: {
    ...mapState(useProductStore, ["products"]),
  },
  methods: {
    ...mapActions(useProductStore, ["getProducts"]),
  },
};
</script>
<template>
  <custom-title icon="mdi-package-variant">Products Management List
    <template #right>
      <v-btn @click="dialog = !dialog"> Open Dialog </v-btn>
    </template>
  </custom-title>
  <v-data-table
    v-model="selected"
    :items="products"
    item-value="name"
    show-select
  ></v-data-table>

    <div class="text-center pa-4">
      <v-dialog v-model="dialog" max-width="400" persistent>
        <v-card
          prepend-icon="mdi-map-marker"
          text="Let Google help apps determine location. This means sending anonymous location data to Google, even when no apps are running."
          title="Use Google's location service?"
        >
          <template v-slot:actions>
            <v-spacer></v-spacer>

            <v-btn @click="dialog = false"> Disagree </v-btn>

            <v-btn @click="dialog = false"> Agree </v-btn>
          </template>
        </v-card>
      </v-dialog>
    </div>
</template>
<style scoped></style>
