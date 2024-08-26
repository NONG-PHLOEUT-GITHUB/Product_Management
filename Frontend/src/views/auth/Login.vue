<template>
  <v-container fluid class="d-flex align-center justify-center fill-height">
    <v-row no-gutters class="fill-height">
      <v-col
        cols="12"
        md="6"
        class="d-none d-md-flex align-center justify-center"
      >
        <v-img
          src="https://cdni.iconscout.com/illustration/premium/thumb/online-product-selling-5631407-4690752.png?f=webp"
          alt="Product Management"
          cover
        ></v-img>
      </v-col>

      <v-col cols="12" md="6" class="d-flex align-center justify-center">
        <v-card class="pa-4" width="500" rounded="lg">
          <v-card-title>Login</v-card-title>
          <v-card-text>
            <v-form @submit.prevent="login">
              <v-text-field
                label="Email"
                v-model="email"
                type="email"
                required
                autocomplete="username"
              ></v-text-field>

              <v-text-field
                autocomplete="current-password"
                label="Password"
                v-model="password"
                type="password"
                required
              ></v-text-field>

              <v-btn type="submit" color="primary" block>Login</v-btn>
            </v-form>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script setup>
  import { ref } from 'vue'

  const email = ref('')
  const password = ref('')

  const login = () => {
    // Handle login logic here
    console.log('Login attempt:', email.value, password.value)
  }
</script>

<style scoped>
  .fill-height {
    height: 100vh;
  }
</style>
