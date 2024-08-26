<template>
  <bread-crumb :items="pathTitle" />
  <custom-title>
    <v-btn
      size="x-small"
      icon="mdi-arrow-left"
      class="white mr-2"
      @click="goBack"
    >
    </v-btn>
    {{ category.name }}
    </custom-title>
  <v-container fluid class="pa-0">
    <v-layout class="py-1">
      <v-card max-width="374" rounded="lg">
        <v-img
          width="auto"
          cover
          src="https://media.istockphoto.com/id/931643150/vector/picture-icon.jpg?s=612x612&w=0&k=20&c=St-gpRn58eIa8EDAHpn_yO4CZZAnGD6wKpln9l3Z3Ok="
        ></v-img>
      </v-card>
      <v-card class="ms-3" rounded="lg">
        <v-card-title>
          {{ category.name }}
        </v-card-title>
        <v-card-text>
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Est
          voluptatibus, consectetur consequatur sit laboriosam laborum animi nisi
          suscipit ex, pariatur, placeat quod dolorem sint id quas beatae
          architecto. Nulla, debitis?
        </v-card-text>
        </v-card>
    </v-layout>
  </v-container>
</template>
<script>
import { mapActions, mapState } from "pinia";
import { useCategoryStore } from "@/stores/category";
export default {
  data() {
    return {};
  },
  created() {
    const id = this.$route.params.id;
    console.log(id);
    this.getCategoryById(id);
  },
  computed: {
    ...mapState(useCategoryStore, ["category"]),
    pathTitle() {
      return [
        {
          title: "Cagategories",
          to: { name: "cagategory" },
          exact: true,
        },
        {
          title: this.category.name + " - " + this.category.description,
        },
      ];
    },
  },
  methods: {
    ...mapActions(useCategoryStore, ["getCategoryById"]),
    goBack() {
      this.$router.back();
    },
  },
};
</script>
