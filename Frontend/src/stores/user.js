import { defineStore } from 'pinia'
import {
  fetchUsers,
  fetchUserById,
  deleteUserById,
  createUser
} from '../api/user'

export const useUserStore = defineStore('user', {
  state: () => ({
    users: [],
    user: []
  }),
  actions: {
    async getUsers() {
      const response = await fetchUsers()
      this.users = response.data.data
    },
    async getUser(id) {
      const response = await fetchUserById(id)
      this.user = response.data.data
    },
    async deleteUser(id) {
      return await deleteUserById(id)
    },
    async createUser(data) {
      return await createUser(data)
    }
  }
})
