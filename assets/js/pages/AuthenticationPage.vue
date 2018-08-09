<template>
<!-- begin:: Page -->
  <div class="m-grid m-grid--hor m-grid--root m-page" style="height: 100vh;">
    <div
      class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-grid--tablet-and-mobile m-grid--hor-tablet-and-mobile m-login m-login--1 m-login--signin"
      id="m_login">
      <div class="m-grid__item m-grid__item--order-tablet-and-mobile-2 m-login__aside">
        <div class="m-stack m-stack--hor m-stack--desktop">
          <div class="m-stack__item m-stack__item--fluid">
            <div class="m-login__wrapper" style="padding-top:26px;">
              <div class="m-login__logo">
                <a href="#">
                <img :src="urlImgLogo()" class="logo-img">
                </a>
              </div>
              <div
                id="block-form-authentication"
                class="m-login__signin"
                style="display:block"
              >
                <div class="m-login__head" v-if="type_auth == 'signIn'">
                  <!--begin::signin head -->
                    <h3 class="m-login__title">
                      {{ $t("authentication.sign_in_to_admin") }}
                    </h3>
                  <!--end::signin head -->
                </div>
                <div class="m-login__head" v-if="type_auth == 'signUp'">
                  <!--begin::signup head -->
                    <h3 class="m-login__title" >
                      {{ $t("authentication.sign_up") }}
                    </h3>
                    <div class="m-login__desc" >
                      {{ $t("authentication.enter_your_details_to_create_your_account") }}
                    </div>
                  <!--end::signup head -->
                </div>
                <div class="m-login__head" v-if="type_auth == 'forgetPassword'">
                  <!--begin::forgetPassword head -->
                    <h3 class="m-login__title" >
                      {{ $t("authentication.forget_password") }}
                    </h3>
                    <div class="m-login__desc">
                      {{ $t("authentication.enter_your_email_to_reset_your_password") }}
                    </div>
                  <!--end::forgetPassword head -->
                </div>
                <!--begin::form -->
                  <form 
                    autocomplete="off"
                    class="m-login__form m-form" 
                    @keydown.enter="handleSubmit"
                    @submit.prevent="validateBeforeSubmit"                
                  >
                    <!--begin::signin inputs -->
                      <div>
                        <div class="form-group m-form__group" v-if="type_auth == 'signUp'">                  
                          <input 
                            type="text" 
                            placeholder="Firstname" 
                            name="firstname"
                            class="form-control m-input"
                            :class="{'input': true, 'is-danger': errors.has('firstname') }"                      
                            v-model="firstname"
                            v-validate="'required|alpha'"
                          >
                        </div>
                        <div class="form-group m-form__group" v-if="type_auth == 'signUp'">
                          <input  
                            type="text" 
                            placeholder="Lastname" 
                            name="lastname"
                            class="form-control m-input"
                            :class="{'input': true, 'is-danger': errors.has('lastname') }"                                              
                            v-model="lastname"
                            v-validate="'required|alpha'"
                          >
                        </div>
                        <div class="form-group m-form__group">
                          <input 
                            autocomplete="off"
                            type="text" 
                            placeholder="Email"
                            name="email"
                            class="form-control m-input"
                            :class="{'input': true, 'is-danger': errors.has('email') }"
                            v-model="email"
                            v-validate="'required|alpha'"
                          >
                        </div>
                        <div class="form-group m-form__group" v-if="type_auth != 'forgetPassword'">
                          <input  
                            autocomplete="off"
                            type="password" 
                            placeholder="Password" 
                            name="password"
                            class="form-control m-input"
                            :class="{'input': true, 'is-danger': errors.has('password') }"
                            ref="password"                       
                            v-model="password"
                            v-validate="'required|min:4'"
                          >
                        </div>
                        <div class="form-group m-form__group" v-if="type_auth == 'signUp'">
                          <input 
                            autocomplete="off"
                            type="password" 
                            placeholder="Confirm Password" 
                            name="password_confirmation"
                            class="form-control m-input"
                            :class="{'input': true, 'is-danger': errors.has('password_confirmation') }"
                            v-model="password_confirmation"
                            v-validate="'required|confirmed:password'"          
                          >
                        </div>
                        <div class="row m-login__form-sub" v-if="type_auth == 'signIn'">
                          <div class="col m--align-left">
                            <label class="m-checkbox m-checkbox--focus">
                            <input type="checkbox" name="remember">
                            {{ $t("authentication.remember_me") }}
                            <span></span>
                            </label>
                          </div>
                          <div class="col m--align-right">
                            <router-link
                              id="m_login_forget_password"
                              class="m-link"
                              :to="{ name: 'forgetPasswordPage' }"
                              v-on:click.native="signupAnimation('forgetPassword')"
                              >
                              {{ $t("authentication.forget_password") }}
                            </router-link>
                          </div>
                        </div>
                      </div> 
                    <!--end::signin inputs -->
                    <!--begin::submit signin -->
                      <div class="m-login__form-action" v-if="type_auth == 'signIn'">
                        <button
                          v-on:click="handleSubmitSignin"
                          id="m_login_signin_submit"
                          class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air"
                        >
                          {{ $t("authentication.sign_in") }}
                        </button>
                      </div>
                    <!--end::submit signin --> 
                    <!--begin::submit signup -->
                      <div class="m-login__form-action" v-if="type_auth == 'signUp'">
                        <button
                          v-on:click="handleSubmitSignup"
                          id="m_login_signup_submit"
                          class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air"
                          >
                        {{ $t("authentication.sign_up") }}
                        </button>
                        <router-link
                          id="m_login_signup_cancel"
                          class="btn btn-outline-focus  m-btn m-btn--pill m-btn--custom"
                          :to="{ name: 'loginPage' }"
                          v-on:click.native="signupAnimation('signIn')"
                          >
                          {{ $t("authentication.cancel") }}
                        </router-link>
                      </div>
                    <!--end::submit signup -->
                    <!--begin::submit forgetpassword -->
                      <div class="m-login__form-action" v-if="type_auth == 'forgetPassword'">
                        <button
                          v-on:click="handleSubmitForgetPassword"
                          id="m_login_forget_password_submit"
                          class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air"
                          >
                        {{ $t("authentication.request") }}
                        </button>
                        <router-link
                          id="m_login_forget_password_cancel"
                          class="btn btn-outline-focus m-btn m-btn--pill m-btn--custom"
                          :to="{ name: 'loginPage' }"
                          v-on:click.native="signupAnimation('signIn')"
                          >
                          {{ $t("authentication.cancel") }}
                        </router-link>
                      </div>
                    <!--end::submit forgetpassword -->                                                                         
                  </form>
                <!--end::form -->
              </div>
            </div>
          </div>
          <div class="alert alert-danger" v-show="errors.any() && type_auth!='signIn'">
            <div v-show="errors.has('firstname')">
              {{ errors.first('firstname') }}
            </div>
            <div v-show="errors.has('lastname')">
              {{ errors.first('lastname') }}
            </div>
            <div v-show="errors.has('email')">
              {{ errors.first('email') }}
            </div>
            <div v-if="errors.has('password')">
              {{ errors.first('password') }}
            </div>
            <div v-if="errors.has('password_confirmation')">
              {{ errors.first('password_confirmation') }}
            </div>
          </div>
          <div class="m-stack__item m-stack__item--center" v-if="type_auth != 'signUp'">
            <div class="m-login__account">
              <span class="m-login__account-msg">{{ $t("authentication.dont_have_an_account_yet") }}</span>
              <router-link
                id="m_login_signup"
                class="m-link m-link--focus m-login__account-link"
                :to="{ name: 'signupPage' }"
                v-on:click.native="signupAnimation('signUp')"
                >
                {{ $t("authentication.sign_up") }}
              </router-link>
            </div>
          </div>
        </div>
      </div>
      <div
        v-if="getWindowWidth() > '1200'"
        class="m-grid__item m-grid__item--fluid m-grid m-grid--center m-grid--hor m-grid__item--order-tablet-and-mobile-1 m-login__content"
        style="background-image: url(./assets/app/media/img/bg/bg-4.jpg)"
        >
        <div class="m-grid__item m-grid__item--middle">
          <h3 class="m-login__welcome">
            {{ $t("authentication.app_manager") }}
          </h3>
          <p class="m-login__msg">
            {{ $t("authentication.supplier_and_product_manager", {controller : type }) }}
          </p>
        </div>
      </div>
    </div>
  </div>  
</template>

<script>
// Global Settings
import globalSettings from '../settings';
// Types
import * as authTypes from '../types/authentication';
import * as globalTypes from '../types/global';

/* NProgress *************************************************************************/
var NProgress = require('../libraries/nprogress.js');
// Component Show Notifications
import VueNotifications from 'vue-notifications';
import axios from 'axios';

export default {
  name: 'AuthenticationPage',
  // Data from father component
  data() {
    return {
      password_confirmation: ''
    };
  },
  // Data from father component or url
  props: {
    type_auth: String
  },
  // Notifications
  notifications: {
    showSuccessMsg: {
      type: VueNotifications.types.success,
      title: "",
      message: ""
    },
    showInfoMsg: {
      type: VueNotifications.types.info,
      title: "",
      message: ""
    },
    showWarnMsg: {
      type: VueNotifications.types.warn,
      title: "",
      message: ""
    },
    showErrorMsg: {
      type: VueNotifications.types.error,
      title: "",
      message: ""
    }
  },
  created() {
    this.$store.state.authentication.auth_type = this.type_auth;
  },
  updated() {
    this.$store.commit(authTypes.MUTATE_TYPE_AUTHENTICATION, this.type_auth);
  },
  computed: {
    firstname: {
      get() {
        return authTypes.USER.firstname;
      },
      set(value) {
        this.$store.commit(authTypes.MUTATE_USER_FIRSTNAME, value);
      }
    },
    lastname: {
      get() {
        return authTypes.USER.lastname;
      },
      set(value) {
        this.$store.commit(authTypes.MUTATE_USER_LASTNAME, value);
      }
    },
    email: {
      get() {
        return authTypes.USER.email;
      },
      set(value) {
        this.$store.commit(authTypes.MUTATE_USER_EMAIL, value);
      }
    },
    password: {
      get() {
        return authTypes.USER.password;
      },
      set(value) {
        this.$store.commit(authTypes.MUTATE_USER_PASSWORD, value);
      }
    },
    auth_type: {
      get() {
        return authTypes.TYPE_AUTHENTICATION;
      },
      set() {
        this.$store.commit(authTypes.MUTATE_TYPE_AUTHENTICATION, this.type_auth);
      }
    }
  },
  // Methods
  methods: {
    // Views and Animations
    urlImgLogo: function() {
      console.log(
        'image loaded...', 
        this.$store.state.global.settings.url_img_logo_vertical.value
      );
      return (this.$store.state.global.settings !== undefined)
        ? this.$store.state.global.settings.url_img_logo_vertical.value
        : null;
    },
    getWindowWidth: function() {
      console.log(
        "window width loaded...",
        this.$store.state.global.window_data.window_width
      );
      return this.$store.state.global.window_data.window_width;
    },
    signupAnimation: function(to) {
      // eslint-disable-next-line
      console.log("signupAnimation running...");
      this.$store.commit(authTypes.MUTATE_TYPE_AUTHENTICATION, to);
      var form = document.getElementById("block-form-authentication");
      form.classList.add("flipInX");
      form.classList.add("animated");
      setTimeout(function() {
        // eslint-disable-next-line
        console.log("removing class...");
        form.classList.remove("flipInX");
        form.classList.remove("animated");
      }, 700);
    },
    handleSubmitSignin: function() {
      // Start progress Bar
      NProgress.start();
      NProgress.set(0.4);
      this.$store.dispatch(authTypes.ACTION_LOGIN);
      // Is logged the user?
      if(
        window.localStorage['token'] != undefined &&
        window.localStorage['refresh_token'] != undefined && 
        this.$store.state.authentication.logged === true
      ){
        this.showSuccessMsg({ message: "User logged", title: "" });
        // redirect to route
        this.$router.replace(this.$route.query.redirect || "/home");
      }
      // Finally progress Bar
      NProgress.done();
    },
    handleSubmitSignup: function() {
      // Todo
    },
    handleSubmitForgetPassword: function() {
      // Todo
    },
    validateBeforeSubmit() {
      if(this.type_auth == 'signUp'){
        this.$validator.validateAll().then(result => {
          if (result) {
            // eslint-disable-next-line
            this.showSuccessMsg({ message: "Form Submitted!", title: "" });
            return;
          }
          this.showWarnMsg({ message: "Correct them errors!", title: "" });
        });
      }
    }
  }
};
</script>

<style scoped>
.logo-img {
  max-width: 120px;
  max-height: 120px;
}
.m-login__signin {
  display: block;
}
.is-danger {
  border-color: #ff3860 !important;
  color: #ff3860;
}
</style>