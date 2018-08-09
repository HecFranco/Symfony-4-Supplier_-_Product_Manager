<template>
  <div id="app">
    <router-view></router-view>
    <locale-changer-component></locale-changer-component>    
  </div>
</template>

<script>
import { mapActions } from "vuex";
import * as globalTypes from "./types/global";

import LocaleChangerComponent from './components/LocaleChanger/LocaleChangerComponent';


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
    this.$store.dispatch(globalTypes.UPDATE_SETTINGS);
  },
};
</script>

<style>
</style>