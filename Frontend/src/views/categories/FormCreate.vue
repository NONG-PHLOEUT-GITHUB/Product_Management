<script>
  import { mapActions, mapState } from 'pinia'
  import { useCategoryStore } from '@/stores/category'

  export default {
    data() {
      return {}
    },
    created() {
      const id = this.$route.params.id
      console.log(id)
      this.getCategoryById(id)
    },
    computed: {
      ...mapState(useCategoryStore, ['category']),
      pathTitle() {
        return [
          {
            title: 'Cagategories',
            to: { name: 'cagategory' },
            exact: true
          },
          {
            title: this.cureentPage
          }
        ]
      },
      cureentPage(){
        if(this.$route.params.id){
          return 'Update new Category'
        }
        return 'Create new Category'
        // this.$route.name
      }
    },
    methods: {
      ...mapActions(useCategoryStore, ['createCategorie', 'getCategoryById']),
      onSubmit() {
        this.createCategorie({
          name: this.category.name,
          description: this.category.description
        })
          .then(() => {
            this.$refs.form.reset()
            this.$router.back()
          })
          .catch(error => {
            // Handle error, show an error message
            console.error('Error creating category:', error)
          })
      },
      goBack() {
        this.$router.back()
      }
    }
  }
</script>
<template>
  <bread-crumb :items="pathTitle" />
  <custom-title>
    <v-btn
      size="x-small"
      icon="mdi-arrow-left"
      class="white mr-2"
      @click="goBack"
    ></v-btn>
   <div v-if="this.$route.params.id != null">Update new Category</div> 
   <div v-else>Create new Category</div> 
  </custom-title>
  <v-card class="pa-2">
    <v-form @submit.prevent="onSubmit" ref="form">
      <v-row>
        <v-col cols="12" sm="6">
          <v-text-field
            v-model="category.name"
            label="Name"
            required
            variant="outlined"
          ></v-text-field>
        </v-col>
        <v-col cols="12" sm="6">
          <v-text-field
            v-model="category.description"
            label="Description"
            required
            variant="outlined"
          ></v-text-field>
        </v-col>
        <v-col cols="12">
          <v-btn type="submit" color="primary">Submit</v-btn>
        </v-col>
      </v-row>
    </v-form>
  </v-card>
</template>
