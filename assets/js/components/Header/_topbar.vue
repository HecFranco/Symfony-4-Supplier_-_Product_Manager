<template>
  <!-- BEGIN: Topbar -->
  <div id="m_header_topbar" class="m-topbar  m-stack m-stack--ver m-stack--general m-stack--fluid">
    <div class="m-stack__item m-topbar__nav-wrapper">
      <ul class="m-topbar__nav m-nav m-nav--inline">
        <flag-menu-component></flag-menu-component>
        <user-menu-component></user-menu-component>
      </ul>
    </div>
  </div>
  <!-- END: Topbar -->
</template>

<script>
// Components
import FlagMenu from "./_flag_menu.vue";
import UserMenu from "./_user_menu.vue";
// Begin::Component
export default {
  name: "Topbar",
  components: {
    'flag-menu-component' : FlagMenu,
    'user-menu-component' : UserMenu
  },
};
// End::Component
</script>
<style scoped lang="scss">
</style>