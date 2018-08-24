<template>
  <!-- BEGIN: flag menu -->
	<li 
		id="flag-menu"
		class="m-nav__item m-topbar__languages m-dropdown m-dropdown--small m-dropdown--arrow m-dropdown--align-right m-dropdown--mobile-full-width"
		v-on:click="userMenuFlagToggler()"
		>
		<a  class="m-nav__link m-dropdown__toggle">
		<span class="m-nav__link-text">
		<img class="flag m-topbar__language-selected-img" :src="urlImageLanguageSelected()">	
		</span>
		</a>
		<div class="m-dropdown__wrapper" style="z-index: 101;">
			<span class="m-dropdown__arrow m-dropdown__arrow--right m-dropdown__arrow--adjust" style="left: auto; right: 5px;"></span>
			<div class="m-dropdown__inner">
				<div class="m-dropdown__header m--align-center" style="background: url(); background-size: cover;">
					<span class="m-dropdown__header-subtitle">{{ $t("navigation.select_language") }}</span>
				</div>
				<div class="m-dropdown__body">
					<div class="m-dropdown__content">
						<ul class="m-nav m-nav--skin-light">
							<li v-for="(lang, index) in listLanguages()" :key="index" class="m-nav__item m-nav__item--active" style="cursor: pointer;">
								<a @click.prevent="changeLanguage(index)" class="m-nav__link m-nav__link--active">
								<span class="m-nav__link-icon"><img class="flag m-topbar__language-img" :src="lang._image"></span>
								<span class="m-nav__link-title m-topbar__language-text m-nav__link-text">{{index}}</span>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</li>
	<!-- END: flag menu -->
</template>

<script>
// Types
import * as globalTypes from "../../types/global";
// Begin::Component
export default {
  name: "FlagMenu",
  methods: {
    userMenuFlagToggler: function() {
      document.getElementById("flag-menu").classList.toggle("m-dropdown--open");
      document.getElementById("user-menu").classList.remove("m-dropdown--open");
    },
    urlImageLanguageSelected() {
      let langSelected = this.$store.state.global.language;
      if (this.$store.state.global.translations[langSelected]) {
        return this.$store.state.global.translations[langSelected]._image;
      } else {
        return "assets/images/languages/default.png";
      }
    },
    changeLanguage(lang) {
      this.$store.dispatch(globalTypes.SET_LANGUAGE, lang);
      this.$i18n.locale = lang;
    },
    listLanguages() {
      let translations = this.$store.state.global.translations;
      return translations;
    },
  },
};
// End::Component
</script>
<style scoped lang="scss">
.flag {
  width: 26px;
  border-radius: 50% !important;
}
</style>