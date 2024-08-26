<template>
  <bread-crumb :items="pathTitle" />
  <custom-title>
    <v-btn
      size="x-small"
      icon="mdi-arrow-left"
      class="white mr-2"
      @click="goBack"
    ></v-btn>
    {{ product.name }}
  </custom-title>
  <v-container fluid class="pa-0">
    <v-row dense>
      <v-col cols="6">
        <v-card rounded="lg">
          <v-img
            width="auto"
            cover
            src="https://media.istockphoto.com/id/931643150/vector/picture-icon.jpg?s=612x612&w=0&k=20&c=St-gpRn58eIa8EDAHpn_yO4CZZAnGD6wKpln9l3Z3Ok="
          ></v-img>
        </v-card>
      </v-col>
      <v-col cols="6">
        <v-card rounded="lg" class="pa-a">
          <v-card-title>
            {{ product.name }}
          </v-card-title>
          <v-card-text>
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Est
            voluptatibus, consectetur consequatur sit laboriosam laborum animi
            nisi suscipit ex, pariatur, placeat quod dolorem sint id quas beatae
            architecto. Nulla, debitis?
            <v-chip rounded="lg">
              <v-card-title>$ {{ product.price }}</v-card-title>
            </v-chip>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>
<script>
  import { mapActions, mapState } from 'pinia'
  import { useProductStore } from '@/stores/product'
  export default {
    data() {
      return {}
    },
    created() {
      const id = this.$route.params.id
      console.log(id)
      this.getProduct(id)
    },
    computed: {
      ...mapState(useProductStore, ['product']),
      pathTitle() {
        return [
          {
            title: 'Products',
            to: { name: 'products' },
            exact: true
          },
          {
            title: this.product.name
            // + " - " + this.category.description,
          }
        ]
      }
    },
    methods: {
      ...mapActions(useProductStore, ['getProduct']),
      goBack() {
        this.$router.back()
      }
    }
  }
</script>
