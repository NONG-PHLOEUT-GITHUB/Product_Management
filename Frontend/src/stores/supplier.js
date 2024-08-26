import { defineStore } from 'pinia'
import {
  fetchSuppliers,
  fetchSupplierById,
  createSupplier,
  deleteSupplierById
} from '../api/supplier'

export const useSupplierStore = defineStore('supplier', {
  state: () => ({
    suppliers: [],
    supplier: []
  }),
  actions: {
    async getSuppliers() {
      const response = await fetchSuppliers()
      this.suppliers = response.data.data
    },
    async getSupplier(id) {
      const response = await fetchSupplierById(id)
      this.supplier = response.data.data
    },
    async postSupplier(id) {
      return await createSupplier(id)
    },
    async deleteSupplier(id) {
      return await deleteSupplierById(id)
    }
  }
})
