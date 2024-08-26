<script>
  import { mapActions, mapState } from 'pinia'
  import { useSupplierStore } from '@/stores/supplier'

  export default {
    data() {
      return {
        selected: [],
        dialog: false,
        headers: [
          { title: 'Id', key: 'id' },
          { title: 'Name', key: 'supplier_name' },
          { title: 'Phone', key: 'phone_number' },
          { title: 'Address', key: 'contact_info' },
          { title: 'Country', key: 'country' },
          { title: '', key: 'actions', width: '16%', sortable: false }
        ]
      }
    },
    created() {
      this.getSuppliers()
    },
    computed: {
      ...mapState(useSupplierStore, ['suppliers'])
    },
    methods: {
      ...mapActions(useSupplierStore, ['getSuppliers', 'deleteSupplier']),
      removeSupplier(id){
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
            this.deleteSupplier(id).then(response => {
              if (response.status == 200) {
                this.$root.$notif('Delete successfully', {
                  type: 'success',
                  color: 'primary'
                })
              }
              this.getSuppliers()
            })
        })
      }
    }
  }
</script>
<template>
  <custom-title icon="mdi-truck-fast">
    Suppliers Management
    <template #right>
      <v-btn to="/suppliers/save">create</v-btn>
    </template>
  </custom-title>
  <v-data-table
    v-model="selected"
    :items="suppliers"
    :headers="headers"
    item-value="id"
    show-select
    hover
  >
    <template v-slot:item.id="{ item }">
      <router-link :to="{ path: '/supplier/' + item.id + '/details' }">
        #{{ item.id }}
      </router-link>
    </template>
    <template v-slot:item.actions="{ item }">
      <v-btn
        icon="mdi-pencil"
        @click="editProduct(item)"
        variant="text"
      ></v-btn>
      <v-btn
        icon="mdi-delete"
        @click="removeSupplier(item.id)"
        color="red"
        variant="text"
      ></v-btn>
      <v-btn
        icon="mdi-eye"
        :to="{ path: '/supplier/' + item.id + '/details' }"
        variant="text"
      ></v-btn>
    </template>
  </v-data-table>
</template>
<style scoped></style>
