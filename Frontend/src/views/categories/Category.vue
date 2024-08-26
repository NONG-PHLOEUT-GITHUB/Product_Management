<script>
  import { mapActions, mapState } from 'pinia'
  import { useCategoryStore } from '@/stores/category'

  export default {
    data() {
      return {
        selected: [],
        dialog: false,
        headers: [
          { title: 'Id', key: 'id' },
          { title: 'Name', key: 'name' },
          { title: 'description', key: 'description' },
          // { title: "Price", key: "price" },
          { title: '', key: 'actions', sortable: false }
        ]
      }
    },
    created() {
      this.getCategories()
    },
    computed: {
      ...mapState(useCategoryStore, ['categories'])
    },
    methods: {
      ...mapActions(useCategoryStore, ['getCategories', 'removeCategorie']),
      deleteCategorie(id) {
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
            this.removeCategorie(id).then(response => {
              if (response.status == 200) {
                this.$root.$notif('Delete successfully', {
                  type: 'success',
                  color: 'primary'
                })
              }
              this.getCategories()
            })
        })
      }
    }
  }
</script>
<template>
  <custom-title icon="mdi-tag-outline">
    Gategories Management
    <template #right>
      <v-btn to="categories/create">create</v-btn>
    </template>
  </custom-title>
  <v-data-table
    v-model="selected"
    :items="categories"
    :headers="headers"
    item-value="id"
    show-select
    hover
  >
    <template v-slot:item.id="{ item }">
      <router-link :to="{ path: '/categories/' + item.id + '/details' }">
        #{{ item.id }}
      </router-link>
    </template>
    <template v-slot:item.actions="{ item }">
      <v-btn
        icon="mdi-pencil"
        :to="{ path: '/categories/' + item.id + '/edit' }"
        variant="text"
      ></v-btn>
      <v-btn
        icon="mdi-delete"
        @click="deleteCategorie(item.id)"
        color="red"
        variant="text"
      ></v-btn>
      <v-btn
        icon="mdi-eye"
        :to="{ path: '/categories/' + item.id + '/details' }"
        variant="text"
      ></v-btn>
    </template>
  </v-data-table>
</template>
<style scoped></style>
