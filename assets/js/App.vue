<template>
  <div id="app">
    <router-view></router-view>
    <locale-changer-component></locale-changer-component>    
  </div>
</template>

<script>
// Types
import * as globalTypes from './types/global';
import * as authTypes from './types/authentication';
// Vuex Plugin
import { mapActions } from "vuex";
// NProgress System
var NProgress = require('./libraries/nprogress.js');
// Components
import LocaleChangerComponent from './components/LocaleChanger/LocaleChangerComponent';
// Begin::Component
export default {
  name: "app",
  components: {
    'locale-changer-component':LocaleChangerComponent
  },
  computed: {
    // todo
  },
  methods: {
    ...mapActions({
      handleSize: globalTypes.UPDATE_WINDOW_DATA_RESIZE,
      handleScroll: globalTypes.UPDATE_WINDOW_DATA_SCROLL,
      handleSettings: globalTypes.UPDATE_SETTINGS,
    })
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