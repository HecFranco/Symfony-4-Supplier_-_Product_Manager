<template>
  <div id="app">
    <div class="m-grid m-grid--hor m-grid--root m-page"> 
      <header-component v-if="viewToolBar()"></header-component>
      <div 
        v-if="viewToolBar()" 
        class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-body"
      >
        <left-aside-component ></left-aside-component>   
        <router-view></router-view>      
      </div>
      <router-view v-if="!viewToolBar()"></router-view>
      <locale-changer-component></locale-changer-component>    
    </div>
  </div>
</template>

<script>
// Types
import * as globalTypes from './types/global';
import * as authTypes from './types/authentication';
// Vuex Plugin
import { mapActions, mapGetters } from "vuex";
// NProgress System
var NProgress = require('./libraries/nprogress.js');
// Components
import LocaleChangerComponent from './components/LocaleChanger/LocaleChangerComponent';
import HeaderComponent from "./components/Header/HeaderComponent";
import LeftAsideComponent from "./components/LeftAside/LeftAsideComponent";
// Begin::Component
export default {
  name: "app",
  components: {
    'left-aside-component': LeftAsideComponent,
    'header-component': HeaderComponent,
    'locale-changer-component': LocaleChangerComponent,    
  },
  computed: {
  },
  methods: {
    ...mapActions({
      handleSize: globalTypes.UPDATE_WINDOW_DATA_RESIZE,
      handleScroll: globalTypes.UPDATE_WINDOW_DATA_SCROLL,
      handleSettings: globalTypes.UPDATE_SETTINGS,
    }),
    viewToolBar(){
      console.log(this.$store.state.authentication.logged);
      return this.$store.state.authentication.logged;
    }
  },
  created() {
    // We use eventlistener because vue has no event of its own for resizing and scrolling
    window.addEventListener('scroll', this.handleScroll);
    window.addEventListener("resize", this.handleSize);
  },
  mounted () {
    // Start progress Bar
    NProgress.start();
    NProgress.set(0.4);
    this.$store.dispatch(globalTypes.UPDATE_SETTINGS);
    if( this.$store.state.authentication.logged === true ){
      this.$store.dispatch(authTypes.UPDATE_USER);
    }  
    // Finally progress Bar
    NProgress.done();
  },
};
</script>

<style>
</style>