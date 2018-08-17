<template>
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
                      <label for="example-text-input" class="col-3 col-form-label">
                      {{ $t("my_profile.first_name") }}
                      </label>
                      <div class="col-9">
                        <input
                          id="myProfileInput_firstname"
                          class="form-control m-input"
                          type="text"
                          v-model="firstName"
                        >
                      </div>
                    </div>
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-3 col-form-label">
                      {{ $t("my_profile.last_name") }}
                      </label>
                      <div class="col-9">
                        <input
                          id="myProfileInput_firstname"
                          class="form-control m-input"
                          type="text"
                          v-model="lastName"
                        >
                      </div>
                    </div>       
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-3 col-form-label">
                      {{ $t("my_profile.email") }}
                      </label>
                      <div class="col-9">
                        <input
                          id="myProfileInput_firstname"
                          class="form-control m-input"
                          type="text"
                          v-model="email"
                        >
                      </div>
                    </div>  
                    <div class="form-group m-form__group row">
                      <label for="example-text-input" class="col-3 col-form-label">
                      {{ $t("my_profile.password") }}
                      </label>
                      <div class="col-9">
                        <input
                          id="myProfileInput_firstname"
                          class="form-control m-input"
                          type="text"
                          v-model="password"
                        >
                      </div>                      
                    </div>                                  
                  </div>
                  <div class="m-portlet__foot m-portlet__foot--fit">
                    <div class="m-form__actions">
                      <div class="row">
                        <div class="col-3"></div>
                        <div class="col-9">
                          <button type="reset" class="btn btn-accent m-btn m-btn--air m-btn--custom">
                          {{ $t("my_profile.save_changes") }}
                          </button>
                          &nbsp;&nbsp;
                          <button type="reset" class="btn btn-secondary m-btn m-btn--air m-btn--custom" style="color:black;">
                          {{ $t("my_profile.cancel") }}
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
</template>

<script>
// Types
import * as myProfileTypes from "../../types/myProfile";

export default {
  name: "EditDataUserComponent",
  props: {
    userData: Object,
  },
  computed: {
    firstName: {
      get() {
        //return myProfileTypes.USER.firstName;
        return this.userData.firstName;
      },
      set(value) {
        this.$store.commit(myProfileTypes.MUTATE_USER_FIRSTNAME, value);
      }
    },
    lastName: {
      get() {
        return this.userData.lastName;
      },
      set(value) {
        this.$store.commit(myProfileTypes.MUTATE_USER_LASTNAME, value);
      }
    },
    email: {
      get() {
        return this.userData.email;
      },
      set(value) {
        this.$store.commit(myProfileTypes.MUTATE_USER_EMAIL, value);
      }
    },   
    password: {
      get() {
        return myProfileTypes.USER.password;
      },
      set(value) {
        this.$store.commit(myProfileTypes.MUTATE_USER_PASSWORD, value);
      }
    },      
  },  
};
</script>
<style scoped lang="scss">
</style>