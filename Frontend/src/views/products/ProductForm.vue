<script>
  import { mapActions, mapState } from 'pinia'
  import { useCategoryStore } from '@/stores/category'
  import { useProductStore } from '@/stores/product'
  export default {
    data() {
      return {
        product: {
          name: '23232',
          description: 'tes',
          price: 2233,
          stock_quantity: 22,
          category_id: 2
        },
        productImages: [],
        autoUpdate: true,
        category: null,
        isUpdating: false
      }
    },
    created() {
      this.getCategories()
    },
    computed: {
      ...mapState(useCategoryStore, ['categories'])
    },
    methods: {
      ...mapActions(useCategoryStore, ['getCategories']),
      ...mapActions(useProductStore, ['create']),
      onSubmit() {
        const formData = {
          ...this.product
        }
        this.create(formData, this.productImages)
          .then(() => {
            // Handle success, maybe clear the form or show a success message
            console.log('Category created successfully')
            this.$refs.form.reset()
            this.productImages = []
            this.$router.back()
          })
          .catch(error => {
            // Handle error, show an error message
            console.error('Error creating category:', error)
          })
      },
      addFiles() {
        console.log('files', this.productImages)
        this.productImages.forEach((file, f) => {
          this.readers[f] = new FileReader()
          this.readers[f].onloadend = e => {
            let fileData = this.readers[f].result
            let imgRef = this.$refs.file[f]
            imgRef.src = fileData
            console.log(fileData)
            // send to server here...
          }

          this.readers[f].readAsDataURL(this.productImages[f])
        })
      },
      handleFileChange(fileList) {
        console.log(fileList)
        this.productImages = Array.from(fileList)
      }
    }
  }
</script>
<template>
  <custom-title icon="mdi-bookmark-outline">Create new Product</custom-title>
  <!-- <v-container> -->
  <v-card class="pa-2">
    <v-form @submit.prevent="onSubmit" ref="form">
      <v-row>
        <v-col>
          <v-autocomplete
            v-model="product.category_id"
            :disabled="isUpdating"
            :items="categories"
            color="blue-grey-lighten-2"
            item-title="name"
            item-value="id"
            label="Select"
            chips
            closable-chips
            variant="outlined"
          >
            <template v-slot:chip="{ props, item }">
              <v-chip
                v-bind="props"
                :prepend-avatar="item.raw.avatar"
                :text="item.raw.name"
              ></v-chip>
            </template>

            <template v-slot:item="{ props, item }">
              <v-list-item
                v-bind="props"
                :prepend-avatar="item.raw.avatar"
                :subtitle="item.raw.group"
                :title="item.raw.name"
                density="compact"
              ></v-list-item>
            </template>
          </v-autocomplete>
        </v-col>
        <v-col>
          <v-file-input
            v-model="productImages"
            label="Product Images"
            multiple
            prepend-icon=""
            prepend-inner-icon="mdi-file"
            variant="outlined"
            accept="image/*"
            counter
            show-size
            chips
            @change="addFiles"
          ></v-file-input>
        </v-col>
      </v-row>
      <v-row>
        <!-- Name Field -->
        <v-col cols="12" sm="6">
          <v-text-field
            v-model="product.name"
            label="Name"
            required
            variant="outlined"
          ></v-text-field>
        </v-col>
        <!-- :rules="[rules.required]" -->

        <!-- Description Field -->
        <v-col cols="12" sm="6">
          <v-text-field
            v-model="product.description"
            label="Description"
            required
            variant="outlined"
          ></v-text-field>
          <!-- :rules="[rules.required]" -->
        </v-col>

        <v-col cols="12" sm="6">
          <v-text-field
            v-model="product.price"
            label="Price"
            required
            variant="outlined"
            prefix="$"
          ></v-text-field>
          <!-- :rules="[rules.required]" -->
        </v-col>

        <v-col cols="12" sm="6">
          <v-text-field
            v-model="product.stock_quantity"
            label="Stock quantity"
            required
            variant="outlined"
          ></v-text-field>
          <!-- :rules="[rules.required]" -->
        </v-col>
      </v-row>
      <v-btn type="submit" color="primary">Submit</v-btn>
    </v-form>
  </v-card>
  <!-- </v-container> -->
</template>
