<script>
import { mapActions, mapState } from "pinia";
import { useSupplierStore } from "@/stores/supplier";

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
    this.getSuppliers();
  },
  computed: {
    ...mapState(useSupplierStore, ["suppliers"]),
  },
  methods: {
    ...mapActions(useSupplierStore, ["getSuppliers"]),
  },
};
</script>
<template>
  <custom-title icon="mdi-truck-fast"
    >Suppliers Management List
    <template #right>
      <v-btn @click="dialog = !dialog"> Open Dialog </v-btn>
    </template>
  </custom-title>
  <v-data-table
    v-model="selected"
    :items="suppliers"
    item-value="name"
    show-select
  ></v-data-table>
</template>
<style scoped></style>
