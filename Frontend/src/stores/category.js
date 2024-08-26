import { defineStore } from "pinia";
import {
  fetchCategories,
  createCategorie,
  deleteCategorie,
  fetchCategory,
} from "../api/category";

export const useCategoryStore = defineStore("category", {
  state: () => ({
    categories: [],
    category: [],
  }),
  actions: {
    async getCategories() {
      const response = await fetchCategories();
      this.categories = response.data.data;
    },
    async getCategoryById(id) {
      const response = await fetchCategory(id);
      this.category = response.data.data;
    },
    async createCategorie(data) {
      return await createCategorie(data);
    },
    async removeCategorie(id) {
      return await deleteCategorie(id);
    },
  },
});
