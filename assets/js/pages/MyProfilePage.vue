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
        <div class="col-xl-9 col-lg-8">
          <div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
            <div class="m-portlet__head">
              <div class="m-portlet__head-tools">
                <ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary" role="tablist">
                  <li class="nav-item m-tabs__item">
                    <a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1" role="tab">
                    <i class="flaticon-share m--hide"></i>
                      {{ $t("my_profile.update_profile") }}
                    </a>
                  </li>
                  <li class="nav-item m-tabs__item">
                    <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_3" role="tab">
                      {{ $t("my_profile.settings") }}
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="tab-content">
              <div class="tab-pane active" id="m_user_profile_tab_1">
                <form class="m-form m-form--fit m-form--label-align-right">
                  <div class="m-portlet__body">
                    <div class="form-group m-form__group row">
                      <div class="col-10 ml-auto">
                        <h3 class="m-form__section">
                          1. {{ $t("my_profile.personal_details") }}
                        </h3>
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-2 col-form-label">
                      First Name
                      </label>
                      <div class="col-7">
                        <input class="form-control m-input" type="text" v-model="firstname">
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-2 col-form-label">
                      Occupation
                      </label>
                      <div class="col-7">
                        <input class="form-control m-input" type="text" value="CTO">
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-2 col-form-label">
                      Company Name
                      </label>
                      <div class="col-7">
                        <input class="form-control m-input" type="text" value="Keenthemes">
                        <span class="m-form__help">
                        If you want your invoices addressed to a company. Leave blank to use your full name.
                        </span>
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-2 col-form-label">
                      Phone No.
                      </label>
                      <div class="col-7">
                        <input class="form-control m-input" type="text" value="+456669067890">
                      </div>
                    </div>
                    <div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>
                    <div class="form-group m-form__group row">
                      <div class="col-10 ml-auto">
                        <h3 class="m-form__section">
                          2. Address
                        </h3>
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-2 col-form-label">
                      Address
                      </label>
                      <div class="col-7">
                        <input class="form-control m-input" type="text" value="L-12-20 Vertex, Cybersquare">
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-2 col-form-label">
                      City
                      </label>
                      <div class="col-7">
                        <input class="form-control m-input" type="text" value="San Francisco">
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-2 col-form-label">
                      State
                      </label>
                      <div class="col-7">
                        <input class="form-control m-input" type="text" value="California">
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-2 col-form-label">
                      Postcode
                      </label>
                      <div class="col-7">
                        <input class="form-control m-input" type="text" value="45000">
                      </div>
                    </div>
                    <div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>
                    <div class="form-group m-form__group row">
                      <div class="col-10 ml-auto">
                        <h3 class="m-form__section">
                          3. Social Links
                        </h3>
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-2 col-form-label">
                      Linkedin
                      </label>
                      <div class="col-7">
                        <input class="form-control m-input" type="text" value="www.linkedin.com/Mark.Andre">
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-2 col-form-label">
                      Facebook
                      </label>
                      <div class="col-7">
                        <input class="form-control m-input" type="text" value="www.facebook.com/Mark.Andre">
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-2 col-form-label">
                      Twitter
                      </label>
                      <div class="col-7">
                        <input class="form-control m-input" type="text" value="www.twitter.com/Mark.Andre">
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-2 col-form-label">
                      Instagram
                      </label>
                      <div class="col-7">
                        <input class="form-control m-input" type="text" value="www.instagram.com/Mark.Andre">
                      </div>
                    </div>
                  </div>
                  <div class="m-portlet__foot m-portlet__foot--fit">
                    <div class="m-form__actions">
                      <div class="row">
                        <div class="col-2"></div>
                        <div class="col-7">
                          <button type="reset" class="btn btn-accent m-btn m-btn--air m-btn--custom">
                          Save changes
                          </button>
                          &nbsp;&nbsp;
                          <button type="reset" class="btn btn-secondary m-btn m-btn--air m-btn--custom">
                          Cancel
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
              <div class="tab-pane " id="m_user_profile_tab_2"></div>
              <div class="tab-pane " id="m_user_profile_tab_3"></div>
            </div>
          </div>
        </div>
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
import * as authTypes from '../types/authentication';
// Components
import SummaryUserData from '../components/MyProfile/SummaryUserDataComponent.vue';

export default {
  name: "MyProfilePage",
  components: {
    'summary-user-data-component': SummaryUserData,
  },
  computed: {
    ...mapGetters({
      userData: authTypes.USER,
    }),
    firstname: {
      get() {
        return myProfileTypes.USER.firstname;
      },
      set(value) {
        this.$store.commit(myProfileTypes.MUTATE_USER_FIRSTNAME, value);
      }
    },
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
  },
};
</script>

<style scoped>
</style>