<template>
  <!-- BEGIN: Topbar -->
  <div id="m_header_topbar" class="m-topbar  m-stack m-stack--ver m-stack--general m-stack--fluid">
    <div class="m-stack__item m-topbar__nav-wrapper">
      <ul class="m-topbar__nav m-nav m-nav--inline">
        <li
          id="user-menu"
          class="m-nav__item m-topbar__user-profile m-topbar__user-profile--img m-dropdown m-dropdown--medium m-dropdown--arrow m-dropdown--header-bg-fill m-dropdown--align-right m-dropdown--mobile-full-width m-dropdown--skin-light"
          v-on:click="userMenuToggler()"
          >
          <a class="m-nav__link m-dropdown__toggle">
          <span class="m-topbar__userpic">
          <img :src="urlImageUser" class="m--img-rounded m--marginless" alt=""/>
          </span>
          <span class="m-topbar__username m--hide">
          {{userData.firstName}}
          </span>
          </a>
          <div class="m-dropdown__wrapper">
            <span class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust"></span>
            <div class="m-dropdown__inner">
              <div class="m-dropdown__header m--align-center" style="background:url(assets/images/media/misc/user_profile_bg.jpg); background-size: cover;">
                <div class="m-card-user m-card-user--skin-dark">
                  <div class="m-card-user__pic">
                    <img :src="urlImageUser" class="m--img-rounded m--marginless"
                      alt=""/>
                  </div>
                  <div class="m-card-user__details">
                    <span class="m-card-user__name m--font-weight-500">
                    {{userData.firstName}} {{userData.lastName}}
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
      </ul>
    </div>
  </div>
  <!-- END: Topbar -->
</template>

<script>
import * as authTypes from "../../types/authentication";
import { mapGetters } from "vuex";
export default {
  name: "Topbar",
  props:{
      urlImageUser: String,
  },
  methods: {
    userMenuToggler: function(){
      document.getElementById('user-menu').classList.toggle('m-dropdown--open');
    },
    logout() {
      // console.log("logout done...!");
      this.$store.dispatch(authTypes.LOGOUT);
      // redirect to route
      this.$router.replace(this.$route.query.redirect || "/login");
    },
  },
  computed: {
    ...mapGetters({
      userData: authTypes.USER,
    })    
  }   
};
</script>
<style scoped lang="scss">
</style>