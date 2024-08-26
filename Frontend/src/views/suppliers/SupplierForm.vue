<script>
  import { mapActions, mapState } from 'pinia'
  import { useSupplierStore } from '@/stores/supplier'

  export default {
    data() {
      return {
        supplier: {
          supplier_name: '',
          contact_info: ''
        },
        productImages: [],
        autoUpdate: true,
        category: null,
        isUpdating: false,
        countries: [
          'Afghanistan',
          'Albania',
          'Algeria',
          'Andorra',
          'Angola',
          'Anguilla',
          'Antigua &amp; Barbuda',
          'Argentina',
          'Armenia',
          'Aruba',
          'Australia',
          'Austria',
          'Azerbaijan',
          'Bahamas',
          'Bahrain',
          'Bangladesh',
          'Barbados',
          'Belarus',
          'Belgium',
          'Belize',
          'Benin',
          'Bermuda',
          'Bhutan',
          'Bolivia',
          'Bosnia &amp; Herzegovina',
          'Botswana',
          'Brazil',
          'British Virgin Islands',
          'Brunei',
          'Bulgaria',
          'Burkina Faso',
          'Burundi',
          'Cambodia',
          'Cameroon',
          'Cape Verde',
          'Cayman Islands',
          'Chad',
          'Chile',
          'China',
          'Colombia',
          'Congo',
          'Cook Islands',
          'Costa Rica',
          'Cote D Ivoire',
          'Croatia',
          'Cruise Ship',
          'Cuba',
          'Cyprus',
          'Czech Republic',
          'Denmark',
          'Djibouti',
          'Dominica',
          'Dominican Republic',
          'Ecuador',
          'Egypt',
          'El Salvador',
          'Equatorial Guinea',
          'Estonia',
          'Ethiopia',
          'Falkland Islands',
          'Faroe Islands',
          'Fiji',
          'Finland',
          'France',
          'French Polynesia',
          'French West Indies',
          'Gabon',
          'Gambia',
          'Georgia',
          'Germany',
          'Ghana',
          'Gibraltar',
          'Greece',
          'Greenland',
          'Grenada',
          'Guam',
          'Guatemala',
          'Guernsey',
          'Guinea',
          'Guinea Bissau',
          'Guyana',
          'Haiti',
          'Honduras',
          'Hong Kong',
          'Hungary',
          'Iceland',
          'India',
          'Indonesia',
          'Iran',
          'Iraq',
          'Ireland',
          'Isle of Man',
          'Israel',
          'Italy',
          'Jamaica',
          'Japan',
          'Jersey',
          'Jordan',
          'Kazakhstan',
          'Kenya',
          'Kuwait',
          'Kyrgyz Republic',
          'Laos',
          'Latvia',
          'Lebanon',
          'Lesotho',
          'Liberia',
          'Libya',
          'Liechtenstein',
          'Lithuania',
          'Luxembourg',
          'Macau',
          'Macedonia',
          'Madagascar',
          'Malawi',
          'Malaysia',
          'Maldives',
          'Mali',
          'Malta',
          'Mauritania',
          'Mauritius',
          'Mexico',
          'Moldova',
          'Monaco',
          'Mongolia',
          'Montenegro',
          'Montserrat',
          'Morocco',
          'Mozambique',
          'Namibia',
          'Nepal',
          'Netherlands',
          'Netherlands Antilles',
          'New Caledonia',
          'New Zealand',
          'Nicaragua',
          'Niger',
          'Nigeria',
          'Norway',
          'Oman',
          'Pakistan',
          'Palestine',
          'Panama',
          'Papua New Guinea',
          'Paraguay',
          'Peru',
          'Philippines',
          'Poland',
          'Portugal',
          'Puerto Rico',
          'Qatar',
          'Reunion',
          'Romania',
          'Russia',
          'Rwanda',
          'Saint Pierre &amp; Miquelon',
          'Samoa',
          'San Marino',
          'Satellite',
          'Saudi Arabia',
          'Senegal',
          'Serbia',
          'Seychelles',
          'Sierra Leone',
          'Singapore',
          'Slovakia',
          'Slovenia',
          'South Africa',
          'South Korea',
          'Spain',
          'Sri Lanka',
          'St Kitts &amp; Nevis',
          'St Lucia',
          'St Vincent',
          'St. Lucia',
          'Sudan',
          'Suriname',
          'Swaziland',
          'Sweden',
          'Switzerland',
          'Syria',
          'Taiwan',
          'Tajikistan',
          'Tanzania',
          'Thailand',
          `Timor L'Este`,
          'Togo',
          'Tonga',
          'Trinidad &amp; Tobago',
          'Tunisia',
          'Turkey',
          'Turkmenistan',
          'Turks &amp; Caicos',
          'Uganda',
          'Ukraine',
          'United Arab Emirates',
          'United Kingdom',
          'United States',
          'Uruguay',
          'Uzbekistan',
          'Venezuela',
          'Vietnam',
          'Virgin Islands (US)',
          'Yemen',
          'Zambia',
          'Zimbabwe'
        ]
      }
    },
    created() {},
    // computed: {
    //   ...mapState(useSupplierStore, ["categories"]),
    // },
    methods: {
      ...mapActions(useSupplierStore, ['postSupplier']),
      onSubmit() {
        const formData = {
          ...this.supplier
        }
        this.postSupplier(formData)
          .then(() => {
            // Handle success, maybe clear the form or show a success message
            console.log('Category created successfully')
            this.$refs.form.reset()
            // this.productImages = [];
            this.$router.back()
          })
          .catch(error => {
            // Handle error, show an error message
            console.error('Error creating category:', error)
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
  <v-card class="pa-2" rounded="lg">
    <v-form @submit.prevent="onSubmit" ref="form">
      <v-row>
        <!-- Name Field -->
        <v-col cols="12" sm="6">
          <v-text-field
            v-model="supplier.contact_info"
            label="Name"
            required
            variant="outlined"
          ></v-text-field>
        </v-col>
        <!-- :rules="[rules.required]" -->

        <!-- Description Field -->
        <v-col cols="12" sm="6">
          <v-text-field
            v-model="supplier.supplier_name"
            label="Description"
            required
            variant="outlined"
          ></v-text-field>
          <!-- :rules="[rules.required]" -->
        </v-col>

        <!-- Submit Button -->
        <v-col cols="12">
          <v-btn type="submit" color="primary">Submit</v-btn>
        </v-col>
      </v-row>
    </v-form>
  </v-card>
  <!-- </v-container> -->
</template>
