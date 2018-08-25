<template>
  <!-- BEGIN: User Menu -->
  <li
    id="user-menu"
    class="m-nav__item m-topbar__user-profile m-topbar__user-profile--img m-dropdown m-dropdown--medium m-dropdown--arrow m-dropdown--header-bg-fill m-dropdown--align-right m-dropdown--mobile-full-width m-dropdown--skin-light"
    v-on:click="userMenuUserToggler()"
  >
    <a class="m-nav__link m-dropdown__toggle">
    <span class="m-topbar__userpic">
    <img :src="urlImageUser()" class="m--img-rounded m--marginless" alt=""/>
    </span>
    <span class="m-topbar__username m--hide">
    {{userData.firstname}}
    </span>
    </a>
    <div class="m-dropdown__wrapper">
      <span class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
      <div class="m-dropdown__inner">
        <div class="m-dropdown__header m--align-center" style="background:url(assets/images/default/user_profile_bg.jpg); background-size: cover;">
          <div class="m-card-user m-card-user--skin-dark">
            <div class="m-card-user__pic">
              <img :src="urlImageUser()" class="m--img-rounded m--marginless"
                alt=""/>
            </div>
            <div class="m-card-user__details">
              <span class="m-card-user__name m--font-weight-500">
              {{userData.firstname}} {{userData.lastname}}
              </span>
              <a href="" class="m-card-user__email m--font-weight-300 m-link">
              {{userData.email}}
              </a>
            </div>
          </div>
        </div>
        <div class="m-dropdown__body">
          <div class="m-dropdown__content">
            <ul class="m-nav m-nav--skin-light">
              <li class="m-nav__section m--hide">
                <span class="m-nav__section-text">
                Section
                </span>
              </li>
              <li class="m-nav__item">
                <router-link
                  :to="{ name: 'myProfilePage'}"
                  class="m-nav__link"
                  >
                  <i class="m-nav__link-icon flaticon-profile-1"></i>
                  <span class="m-nav__link-title">
                    <span class="m-nav__link-wrap">
                      <router-link
                        :to="{ name: 'myProfilePage'}"
                        class="m-nav__link-text"
                        >
                        {{ $t("navigation.my_profile") }}
                      </router-link>
                    </span>
                  </span>
                </router-link>
              </li>
              <li class="m-nav__separator m-nav__separator--fit"></li>
              <li class="m-nav__item">
                <a @click.prevent="logout()"
                  href="/logout"
                  class="btn m-btn--pill btn-secondary m-btn m-btn--custom m-btn--label-brand m-btn--bolder"
                  >
                {{ $t("navigation.logout") }}
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </li>
  <!-- END: User Menu -->
</template>

<script>
// Types
import * as authTypes from "../../types/authentication";
// Vuex Plugin
import { mapGetters } from "vuex";
// Begin::Component
export default {
  name: "UserMenu",
  methods: {
    userMenuUserToggler: function(){
      document.getElementById('user-menu').classList.toggle('m-dropdown--open');
      document.getElementById('flag-menu').classList.remove('m-dropdown--open');
    },
    logout() {
      // console.log("logout done...!");
      this.$store.dispatch(authTypes.LOGOUT);
      // redirect to route
      this.$router.replace(this.$route.query.redirect || "/login");
    },
    urlImageUser: function() {
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
  computed: {
    ...mapGetters({
      userData: authTypes.USER,
    })    
  }   
};
// End::Component
</script>
<style scoped lang="scss">
</style>