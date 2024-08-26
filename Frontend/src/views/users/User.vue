<script>
  import { mapActions, mapState } from 'pinia'
  import { useUserStore } from '@/stores/user'

  export default {
    data() {
      return {
        selected: [],
        dialog: false,
        headers: [
          { title: 'Id', key: 'id', width: '2px' },
          { title: 'Name', key: 'username' },
          { title: 'Email', key: 'email' },
          { title: 'Role', key: 'role', align: 'center' },
          { title: '', key: 'actions', width: '16%', sortable: false }
        ]
      }
    },
    created() {
      this.getUsers()
    },
    computed: {
      ...mapState(useUserStore, ['users'])
    },
    methods: {
      ...mapActions(useUserStore, ['getUsers', 'deleteUser']),
      getRoleColor(role) {
        switch (role) {
          case 'Admin':
            return 'red'
          case 'Customer':
            return 'blue'
          case 'Employee':
            return 'green'
          default:
            return 'grey'
        }
      },
      getRoleIcon(role) {
        switch (role) {
          case 'Admin':
            return 'mdi-shield-crown-outline'
          case 'Customer':
            return 'blue'
          case 'Employee':
            return 'mdi-briefcase'
          default:
            return 'grey'
        }
      },
      removeUser(id){
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
            this.deleteUser(id).then(response => {
              if (response.status == 200) {
                this.$root.$notif('Delete successfully', {
                  type: 'success',
                  color: 'primary'
                })
              }
              this.getUsers()
            })
        })
      }
    }
  }
</script>
<template>
  <custom-title icon="mdi-account-supervisor">
    Users Management
    <template #right>
      <v-btn to="/save/user">create</v-btn>
    </template>
  </custom-title>
  <v-data-table
    v-model="selected"
    :items="users"
    :headers="headers"
    item-value="id"
    show-select
  >
    <template v-slot:item.role="{ item }">
      <v-chip
        :color="getRoleColor(item.role)"
        :prepend-icon="getRoleIcon(item.role)"
      >
        {{ item.role }}
      </v-chip>
    </template>
    <template v-slot:item.id="{ item }">
      <router-link :to="{ path: '/users/' + item.id + '/details' }">
        #{{ item.id }}
      </router-link>
    </template>
    <template v-slot:item.actions="{ item }">
      <v-btn
        icon="mdi-pencil"
        :to="{ path: '/users/' + item.id + '/edit' }"
        variant="text"
      ></v-btn>
      <v-btn
        icon="mdi-delete"
        @click="removeUser(item.id)"
        color="red"
        variant="text"
      ></v-btn>
      <!-- <v-btn
        icon="mdi-eye"
        :to="{ path: '/users/' + item.id + '/details' }"
        variant="text"
      ></v-btn> -->
    </template>
  </v-data-table>
</template>
