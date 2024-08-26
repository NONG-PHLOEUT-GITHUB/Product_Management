<template>
  <custom-title icon="mdi-cog">General Settings</custom-title>
  <v-card rounded="lg">
    <v-form>
      <v-card-title>Change Password</v-card-title>
      <v-card-text>
        <v-row dense>
          <v-col cols="6">
            <label for="">Current Password</label>
            <v-text-field
              placeholder="Enter your current password"
              variant="outlined"
              v-model="siteName"
              density="comfortable"
            ></v-text-field>
          </v-col>
        </v-row>
        <v-row dense>
          <v-col>
            <label for="siteURL">New Password</label>
            <v-text-field
              placeholder="Enter your new password"
              variant="outlined"
              v-model="siteURL"
              density="comfortable"
            ></v-text-field>
          </v-col>
          <v-col>
            <label for="">Confirm new Password</label>
            <v-text-field
              placeholder="Enter your confirm new password"
              variant="outlined"
              v-model="siteName"
              density="comfortable"
            ></v-text-field>
          </v-col>
        </v-row>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn variant="outlined">Reset</v-btn>
        <v-btn variant="outlined" class="bg-primary">Save Change</v-btn>
      </v-card-actions>
    </v-form>
    <v-img src="https://api.product.management.com/public/images/products/download.png"></v-img>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      siteName: "",
      siteURL: "",
    };
  },
};
</script>
<style scoped>

</style>