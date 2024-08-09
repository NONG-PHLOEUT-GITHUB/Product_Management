import { defineStore } from "pinia";
import { fetchProducts } from "../api/product";

export const useProductStore = defineStore("product", {
  state: () => ({
    products: [],
  }),
  actions: {
    async getProducts() {
      const response = await fetchProducts();
      this.products = response.data.data;
    },
  },
});
