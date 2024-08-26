<script>
  import { mapActions, mapState } from 'pinia'
  import { useUserStore } from '../../stores/user'

  export default {
    data() {
      return {
        roles: [
          { id: 1, name: 'Admin' },
          { id: 2, name: 'Employee' }
        ],
        productImages: [],
        autoUpdate: true,
        category: null,
        isUpdating: false
      }
    },
    created() {
      const id = this.$route.params.id
      if (id) {
        this.getUser(id)
      }
    },
    computed: {
      ...mapState(useUserStore, ['user']),
      pathTitle() {
        return [
          {
            title: 'Users',
            to: { name: 'users' },
            exact: true
          },
          {
            title: this.currentPage
          }
        ]
      },
      currentPage() {
        return 'Create new User'
      }
    },
    methods: {
      ...mapActions(useUserStore, ['createUser', 'getUser']),
      goBack() {
        this.$router.back()
      },
      onSubmit() {
        const formData = {
          ...this.user
        }
        this.createUser(formData)
          .then(() => {
            this.$root.$notif('Delete successfully', {
              type: 'success',
              color: 'primary'
            })
            this.$refs.form.reset()
            // this.productImages = [];
            this.$router.back()
          })
          .catch(error => {
            // Handle error, show an error message
            console.error('Error creating category:', error)
          })
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
    Create new User
  </custom-title>
  <v-card class="pa-2" rounded="lg">
    <v-form @submit.prevent="onSubmit" ref="form">
      <v-row>
        <v-col>
          <v-select
            v-model="user.role"
            label="Role"
            :items="roles"
            item-value="name"
            item-key="id"
            item-title="name"
            chips
            variant="outlined"
          ></v-select>
        </v-col>
        <v-col cols="12" sm="6">
          <v-text-field
            v-model="user.email"
            label="Email"
            required
            variant="outlined"
          ></v-text-field>
        </v-col>
      </v-row>
      <v-row>
        <!-- Name Field -->
        <!-- <v-col cols="12" sm="6">
          <v-text-field
            v-model="user.contact_info"
            label="Name"
            required
            variant="outlined"
          ></v-text-field>
        </v-col> -->

        <v-col cols="12" sm="6">
          <v-text-field
            v-model="user.username"
            label="username"
            required
            variant="outlined"
          ></v-text-field>
        </v-col>

        <!-- Submit Button -->
        <v-col cols="12">
          <v-btn type="submit" color="primary">Submit</v-btn>
        </v-col>
      </v-row>
    </v-form>
  </v-card>
</template>
