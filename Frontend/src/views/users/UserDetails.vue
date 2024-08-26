<script>
  import { mapActions, mapState } from 'pinia'
  import { useUserStore } from '@/stores/user'

  export default {
    data() {
      return {}
    },
    created() {
      const id = this.$route.params.id
      this.getUser(id)
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
            title: this.user.username + ' - ' + this.user.email
          }
        ]
      }
    },
    methods: {
      ...mapActions(useUserStore, ['getUser']),
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
    {{ user.username }}
  </custom-title>
  <v-layout class="bg-red">
    <v-col class="pa-0 me-3">
      <v-card>
        <div class="d-flex flex-no-wrap justify-space-between">
          <div>
            <v-card-title>Halcyon Days</v-card-title>

            <v-card-subtitle>Ellie Goulding</v-card-subtitle>

            <v-card-actions>
              <v-btn class="ms-2" icon="mdi-play" variant="text"></v-btn>
            </v-card-actions>
          </div>

          <v-avatar class="ma-3" rounded="lg" size="125">
            <v-img
              src="https://cdn.vuetifyjs.com/images/cards/halcyon.png"
            ></v-img>
          </v-avatar>
        </div>
      </v-card>
    </v-col>
    <v-card
      class="mx-auto text-white"
      color="#26c6da"
      prepend-icon="mdi-twitter"
      title="Twitter"
    >
      <template v-slot:prepend>
        <v-icon size="x-large"></v-icon>
      </template>

      <v-card-text class="py-2">
        "Turns out semicolon-less style is easier and safer in TS because most
        gotcha edge cases are type invalid as well."
      </v-card-text>

      <v-card-actions>
        <v-list-item class="w-100">
          <template v-slot:prepend>
            <v-avatar
              color="grey-darken-3"
              image="https://avataaars.io/?avatarStyle=Transparent&topType=ShortHairShortCurly&accessoriesType=Prescription02&hairColor=Black&facialHairType=Blank&clotheType=Hoodie&clotheColor=White&eyeType=Default&eyebrowType=DefaultNatural&mouthType=Default&skinColor=Light"
            ></v-avatar>
          </template>

          <v-list-item-title>Evan You</v-list-item-title>

          <v-list-item-subtitle>Vue Creator</v-list-item-subtitle>

          <template v-slot:append>
            <div class="justify-self-end">
              <v-icon class="me-1" icon="mdi-heart"></v-icon>
              <span class="subheading me-2">256</span>
              <span class="me-1">·</span>
              <v-icon class="me-1" icon="mdi-share-variant"></v-icon>
              <span class="subheading">45</span>
            </div>
          </template>
        </v-list-item>
      </v-card-actions>
    </v-card>
  </v-layout>
</template>
