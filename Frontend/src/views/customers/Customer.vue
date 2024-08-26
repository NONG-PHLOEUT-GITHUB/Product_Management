<script>
import { mapActions, mapState } from "pinia";
import { useUserStore } from "@/stores/user";

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
    this.getUsers();
  },
  computed: {
    ...mapState(useUserStore, ["users"]),
  },
  methods: {
    ...mapActions(useUserStore, ["getUsers"]),
  },
};
</script>
<template>
  <custom-title icon="mdi-account-tie">Customers Management</custom-title>
  <v-data-table
    v-model="selected"
    :items="users"
    item-value="email"
    show-select
  ></v-data-table>
</template>
