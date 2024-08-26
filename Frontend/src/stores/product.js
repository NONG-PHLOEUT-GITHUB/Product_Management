import { defineStore } from 'pinia'
import {
  fetchProducts,
  fetchProductByID,
  createProduct,
  deleteProductByID
} from '../api/product'

export const useProductStore = defineStore('product', {
  state: () => ({
    products: [],
    product: []
  }),
  actions: {
    async getProducts() {
      const response = await fetchProducts()
      console.log(response.data.data);
      this.products = response.data.data
    },
    async getProduct(id) {
      const response = await fetchProductByID(id)
      this.product = response.data.data
    },
    async create(data, productImages) {
      return await createProduct(data, productImages)
    },
    async deleteProductByID(id) {
      return await deleteProductByID(id)
    }
  }
})
