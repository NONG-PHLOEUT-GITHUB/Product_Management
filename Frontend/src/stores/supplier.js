import { defineStore } from "pinia";
import { fetchSuppliers } from "../api/supplier";

export const useSupplierStore = defineStore("supplier", {
  state: () => ({
    suppliers: [],
  }),
  actions: {
    async getSuppliers() {
      const response = await fetchSuppliers();
      this.suppliers = response.data.data;
    },
  },
});
