<template>
  <bread-crumb :items="pathTitle" />
  <custom-title>
    <v-btn
      size="x-small"
      icon="mdi-arrow-left"
      class="white mr-2"
      @click="goBack"
    ></v-btn>
    {{ supplier.supplier_name }}
  </custom-title>
  <v-container fluid class="pa-0">
    <!-- <v-layout class="pa-1"> -->
    <!-- <v-card max-width="374" rounded="lg">
        <v-img
          width="auto"
          cover
          src="https://media.istockphoto.com/id/931643150/vector/picture-icon.jpg?s=612x612&w=0&k=20&c=St-gpRn58eIa8EDAHpn_yO4CZZAnGD6wKpln9l3Z3Ok="
        ></v-img>
      </v-card> -->
    <!-- class="ms-3" -->
    <v-card
      width="100%"
      rounded="lg"
      :title="supplier.supplier_name"
      subtitle="prepend and append"
    >
      <template v-slot:prepend>
        <v-avatar size="50" rounded="lg">
          <v-img
            alt="John"
            src="https://logowik.com/content/uploads/images/aliexpress-2024-new-logo-a-icon8716.logowik.com.webp"
            cover
          ></v-img>
        </v-avatar>
      </template>
      <v-card-text>
        <v-row>
          <v-col cols="12" md="6" lg="6">
            <label for="">Supplier Company Name</label>
            <v-text-field
              v-model="supplier.contact_info"
              required
              variant="outlined"
              readonly
              rounded="lg"
            ></v-text-field>
          </v-col>
          <v-col cols="12" md="6" lg="6">
            <label for="">Contact Person</label>
            <v-text-field
              v-model="supplier.contact_info"
              required
              variant="outlined"
              readonly
              rounded="lg"
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row>
          <v-col cols="12" md="6" lg="6">
            <label for="">Email</label>
            <v-text-field
              v-model="supplier.contact_info"
              required
              variant="outlined"
              readonly
              rounded="lg"
            ></v-text-field>
          </v-col>
          <v-col cols="12" md="6" lg="6">
            <label for="">Phone Number</label>
            <v-text-field
              v-model="supplier.contact_info"
              required
              variant="outlined"
              readonly
              rounded="lg"
            ></v-text-field>
          </v-col>
          <v-col cols="12" md="6" lg="6">
            <label for="">Address</label>
            <v-text-field
              v-model="supplier.contact_info"
              required
              variant="outlined"
              readonly
              rounded="lg"
            ></v-text-field>
          </v-col>
          <v-col cols="12" md="6" lg="6">
            <label for="">Address</label>
            <v-text-field
              v-model="supplier.contact_info"
              required
              variant="outlined"
              readonly
              rounded="lg"
            ></v-text-field>
          </v-col>
        </v-row>
      </v-card-text>
    </v-card>
    <!-- </v-layout> -->
  </v-container>
</template>
<script>
  import { mapActions, mapState } from 'pinia'
  import { useSupplierStore } from '@/stores/supplier'
  export default {
    data() {
      return {}
    },
    created() {
      const id = this.$route.params.id
      console.log(id)
      this.getSupplier(id)
    },
    computed: {
      ...mapState(useSupplierStore, ['supplier']),
      pathTitle() {
        return [
          {
            title: 'Suppliers',
            to: { name: 'suppliers' },
            exact: true
          },
          {
            title: this.supplier.supplier_name
            // + " - " + this.category.description,
          }
        ]
      }
    },
    methods: {
      ...mapActions(useSupplierStore, ['getSupplier']),
      goBack() {
        this.$router.back()
      }
    }
  }
</script>
