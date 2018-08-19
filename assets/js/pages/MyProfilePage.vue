<template>
  <div class="m-grid__item m-grid__item--fluid m-wrapper">
    <!-- BEGIN: Subheader -->
    <div class="m-subheader ">
      <div class="d-flex align-items-center">
        <div class="mr-auto">
          <h3 class="m-subheader__title ">
            {{ $t("my_profile.title") }}
          </h3>
        </div>
      </div>
    </div>
    <!-- END: Subheader -->
    <div class="m-content">
      <div class="row">
        <!-- Begin::Summary User Data -->
          <summary-user-data-component 
            :userData = "userData"
            :urlImageUser="urlImageUser()"
            class="col-xl-3 col-lg-4"
          >
          </summary-user-data-component>
        <!-- End::Summary User Data -->
        <!-- Begin::Edit User Data -->
          <edit-data-user-component
            :userData = "userData"
          >
          </edit-data-user-component>
        <!-- Begin::Edit User Data -->
      </div>
    </div>
  </div>
</template>

<script>
// Plugins
import { mapGetters } from "vuex";
// Types
import * as myProfileTypes from "../types/myProfile";
import * as authTypes from "../types/authentication";
// Components
import SummaryUserData from "../components/MyProfile/SummaryUserDataComponent.vue";
import EditDataUser from "../components/MyProfile/EditDataUser.vue";

export default {
  name: "MyProfilePage",
  components: {
    "summary-user-data-component": SummaryUserData,
    "edit-data-user-component": EditDataUser
  },
  computed: {
    ...mapGetters({
      userData: authTypes.USER
    })
  },
  methods: {
    // Views and Animations
    urlImageUser() {
      if (
        this.$store.state.authentication.user.image === undefined ||
        this.$store.state.authentication.user.image === null
      ) {
        return "assets/images/default/user_default.png";
      } else {
        return this.$store.state.authentication.user.image;
      }
    },
  }
};
</script>

<style scoped>
</style>