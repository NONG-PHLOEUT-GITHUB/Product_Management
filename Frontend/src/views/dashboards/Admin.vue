<template>
  <custom-title icon="mdi-view-dashboard-outline">Dashboard</custom-title>

  <v-container fluid class="pa-0">
    <v-row>
      <!-- Statistics Cards -->
      <v-col cols="12" md="4">
        <v-card class="pa-4">
          <v-icon size="36">mdi-package-variant</v-icon>
          <v-card-title>Total Products</v-card-title>
          <v-card-subtitle>{{ totalProducts }}</v-card-subtitle>
        </v-card>
      </v-col>
      <v-col cols="12" md="4">
        <v-card class="pa-4">
          <v-icon size="36">mdi-truck</v-icon>
          <v-card-title>Suppliers</v-card-title>
          <v-card-subtitle>{{ totalSuppliers }}</v-card-subtitle>
        </v-card>
      </v-col>
      <v-col cols="12" md="4">
        <v-card class="pa-4">
          <v-icon size="36">mdi-cash-register</v-icon>
          <v-card-title>Total Sales</v-card-title>
          <v-card-subtitle>${{ totalSales }}</v-card-subtitle>
        </v-card>
      </v-col>
    </v-row>

    <!-- Product List -->
    <v-row>
      <v-col cols="12">
        <v-card>
          <v-card-title>
            Products
            <v-spacer></v-spacer>
            <v-btn color="primary" @click="addProduct">Add Product</v-btn>
          </v-card-title>
          <v-data-table
            :items="products"
            :headers="headers"
            class="elevation-1"
          >
            <template v-slot:item.actions="{ item }">
              <v-btn icon @click="editProduct(item)">
                <v-icon>mdi-pencil</v-icon>
              </v-btn>
              <v-btn icon @click="deleteProduct(item)">
                <v-icon color="red">mdi-delete</v-icon>
              </v-btn>
            </template>
          </v-data-table>
        </v-card>
      </v-col>
    </v-row>

    <!-- Supplier List -->
    <v-row>
      <v-col cols="12">
        <v-card>
          <v-card-title>
            Suppliers
            <v-spacer></v-spacer>
            <v-btn color="primary" @click="addSupplier">Add Supplier</v-btn>
          </v-card-title>
          <v-data-table
            :items="suppliers"
            :headers="supplierHeaders"
            class="elevation-1"
          >
            <template v-slot:item.actions="{ item }">
              <v-btn icon @click="editSupplier(item)">
                <v-icon>mdi-pencil</v-icon>
              </v-btn>
              <v-btn icon @click="deleteSupplier(item)">
                <v-icon color="red">mdi-delete</v-icon>
              </v-btn>
            </template>
          </v-data-table>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script setup>
import { ref } from "vue";

const totalProducts = ref(150);
const totalSuppliers = ref(45);
const totalSales = ref(100000);

const products = ref([
  { name: "Product 1", category: "Category 1", price: 100 },
  { name: "Product 2", category: "Category 2", price: 200 },
  // Add more products as needed
]);

const suppliers = ref([
  { name: "Supplier 1", contact: "contact1@example.com" },
  { name: "Supplier 2", contact: "contact2@example.com" },
  // Add more suppliers as needed
]);

const headers = [
  { text: "Name", value: "name" },
  { text: "Category", value: "category" },
  { text: "Price", value: "price" },
  { text: "Actions", value: "actions", sortable: false },
];

const supplierHeaders = [
  { text: "Name", value: "name" },
  { text: "Contact", value: "contact" },
  { text: "Actions", value: "actions", sortable: false },
];

function addProduct() {
  console.log("Add Product");
}

function editProduct(item) {
  console.log("Edit Product:", item);
}

function deleteProduct(item) {
  console.log("Delete Product:", item);
}

function addSupplier() {
  console.log("Add Supplier");
}

function editSupplier(item) {
  console.log("Edit Supplier:", item);
}

function deleteSupplier(item) {
  console.log("Delete Supplier:", item);
}
</script>

<style scoped>
.pa-4 {
  padding: 16px;
}
</style>
