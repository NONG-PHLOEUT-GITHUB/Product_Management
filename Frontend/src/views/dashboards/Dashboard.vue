<template>
  <custom-title icon="mdi-view-dashboard-outline">Dashboard</custom-title>

  <v-container fluid class="pa-0">
    <v-row>
      <!-- Statistics Cards -->
      <v-col cols="12" md="3">
        <v-card class="pa-1" rounded="lg">
          <template v-slot:append>
            <v-btn icon="mdi-package-variant"></v-btn>
          </template>
          <template v-slot:prepend>
            <v-card-title>Total Products</v-card-title>
          </template>
          <v-card variant="tonal" class="bg-primary" rounded="lg">
            <template v-slot:prepend>
              <v-btn icon="mdi-arrow-up" size="small"></v-btn>
              <v-card-title class="ms-3">
                {{ products.length }}
              </v-card-title>
            </template>
          </v-card>
        </v-card>
      </v-col>
      <v-col cols="12" md="3">
        <v-card class="pa-1" rounded="lg">
          <template v-slot:append>
            <v-btn icon="mdi-truck"></v-btn>
          </template>
          <template v-slot:prepend>
            <v-card-title>Total Suppliers</v-card-title>
          </template>
          <v-card variant="tonal" class="bg-primary" rounded="lg">
            <template v-slot:prepend>
              <v-btn icon="mdi-arrow-up" size="small"></v-btn>
              <v-card-title class="ms-3">{{ suppliers.length }}</v-card-title>
            </template>
          </v-card>
        </v-card>
      </v-col>
      <v-col cols="12" md="3" rounded="lg">
        <v-card class="pa-1">
          <template v-slot:append>
            <v-btn icon="mdi-cash-register"></v-btn>
          </template>
          <template v-slot:prepend>
            <v-card-title>Total Sales</v-card-title>
          </template>
          <v-card variant="tonal" class="bg-primary" rounded="lg">
            <template v-slot:prepend>
              <v-btn icon="mdi-arrow-up" size="small"></v-btn>
              <v-card-title class="ms-3">$ 30004</v-card-title>
            </template>
          </v-card>
        </v-card>
      </v-col>
      <v-col cols="12" md="3">
        <v-card class="pa-1" rounded="lg">
          <template v-slot:append>
            <v-btn icon="mdi-account-tie"></v-btn>
          </template>
          <template v-slot:prepend>
            <v-card-title>Total Users</v-card-title>
          </template>
          <v-card elevation="0" class="bg-primary" rounded="lg">
            <template v-slot:prepend>
              <v-btn icon="mdi-arrow-down" size="small"></v-btn>
              <v-card-title class="ms-3">
                {{ users.length }}
              </v-card-title>
            </template>
          </v-card>
        </v-card>
      </v-col>
    </v-row>
    <v-row>
      <v-col>
        <v-card>
          <div class="text-center">
            <v-progress-circular
              :model-value="value"
              :rotate="360"
              :size="100"
              :width="15"
              color="teal"
            >
              <template v-slot:default>{{ value }} %</template>
            </v-progress-circular>
          </div>
          <v-img src="https://api.product.management.com/images/products/images%20(1)_m06f38iq_2.png"></v-img>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
  import { mapActions, mapState } from 'pinia'
  import { useUserStore } from '../../stores/user'
  import { useProductStore } from '../../stores/product'
  import { useSupplierStore } from '../../stores/supplier'

  export default {
    data() {
      return {
        value:20
      }
    },
    created() {
      this.getUsers()
      this.getProducts()
      this.getSuppliers()
    },
    computed: {
      ...mapState(useUserStore, ['users']),
      ...mapState(useProductStore, ['products']),
      ...mapState(useSupplierStore, ['suppliers'])
    },
    methods: {
      ...mapActions(useUserStore, ['getUsers']),
      ...mapActions(useProductStore, ['getProducts']),
      ...mapActions(useSupplierStore, ['getSuppliers'])
    }
  }
</script>

<style scoped>
  .pa-4 {
    padding: 16px;
  }
</style>
