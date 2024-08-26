<script>
  import { mapActions, mapState } from 'pinia'
  import { useProductStore } from '@/stores/product'

  export default {
    data() {
      return {
        selected: [],
        dialog: false,
        headers: [
          { title: 'Id', key: 'id' },
          { title: 'Image', key: 'image' },
          { title: 'Name', key: 'name' },
          { title: 'Price', key: 'price' },
          { title: 'Stock Quantity', key: 'stock_quantity' },
          { title: '', key: 'actions', width: '16%', sortable: false }
        ]
      }
    },
    created() {
      this.getProducts()
    },
    computed: {
      ...mapState(useProductStore, ['products'])
    },
    methods: {
      ...mapActions(useProductStore, ['getProducts','deleteProductByID']),
      removeProduct(id){
         this.$root.$confirm({
          // title: this.$t('alert.confirm'),
          message: 'Are you sure?',
          options: {
            agreeBtnText: 'Yes',
            type: 'error',
            color: 'error',
            width: 400
          },
          agree: () =>
            this.deleteProductByID(id).then(response => {
              if (response.status == 200) {
                this.$root.$notif('Delete successfully', {
                  type: 'success',
                  color: 'primary'
                })
              }
              this.getProducts()
            })
        })
      }
    }
  }
</script>
<template>
  <custom-title icon="mdi-package-variant">
    Products Management
    <template #right>
      <v-btn @click="dialog = !dialog">Uploads</v-btn>
      <v-btn to="/products/save" class="ms-4">Create</v-btn>
    </template>
  </custom-title>
  <v-data-table
    v-model="selected"
    :items="products"
    :headers="headers"
    item-value="name"
    show-select
    hover
  >
    <template v-slot:item.id="{ item }">
      <router-link :to="{ path: '/products/' + item.id + '/details' }">
        #{{ item.id }}
      </router-link>
    </template>
    <template v-slot:item.image="{ item }">
      <v-card class="my-2" elevation="2" rounded>
        <v-img :src="item.image" cover height="64"></v-img>
      </v-card>
    </template>
    <template v-slot:item.actions="{ item }">
      <v-btn
        icon="mdi-pencil"
        @click="editProduct(item)"
        variant="text"
      ></v-btn>
      <v-btn
        icon="mdi-delete"
        @click="removeProduct(item.id)"
        color="red"
        variant="text"
      ></v-btn>
      <v-btn
        icon="mdi-eye"
        :to="{ path: '/products/' + item.id + '/details' }"
        variant="text"
      ></v-btn>
    </template>
  </v-data-table>

  <div class="text-center pa-4">
    <v-dialog v-model="dialog" max-width="400" persistent>
      <v-card
        prepend-icon="mdi-map-marker"
        text="Let Google help apps determine location. This means sending anonymous location data to Google, even when no apps are running."
        title="Use Google's location service?"
      >
        <template v-slot:actions>
          <v-spacer></v-spacer>

          <v-btn @click="dialog = false">Disagree</v-btn>

          <v-btn @click="dialog = false">Agree</v-btn>
        </template>
      </v-card>
    </v-dialog>
  </div>
</template>
<style scoped></style>
