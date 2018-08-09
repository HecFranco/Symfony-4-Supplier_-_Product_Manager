<template>
    <div id="app" class="m-grid m-grid--hor m-grid--root m-page">
        <header-component></header-component>
        <left-aside-component></left-aside-component>
    </div>
</template>

<script>
// Global Settings
import globalSettings from "../settings";
// Components
import HeaderComponent from "../components/Header/HeaderComponent";
import LeftAsideComponent from "../components/LeftAside/LeftAsideComponent";

export default {
  name: "HomePage",
  components: {
    "header-component": HeaderComponent,
    "left-aside-component": LeftAsideComponent
  }
};
</script>

<style scoped>
</style>