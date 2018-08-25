<template>
	<div class="locale-changer">
		<!--
		<select v-model="$i18n.locale" >
		-->
		<select v-model="changeLanguage" >
			<option v-for="(lang, i) in langs" :key="`Lang${i}`" :value="lang">{{ lang }}</option>
		</select>
	</div>
</template>

<script>
import * as globalTypes from "../../types/global";

export default {
  name: "LocaleChangerComponent",
  data () {
    return { langs: ['es-ES', 'en'] }
	},
  computed: {
    changeLanguage: {
      get() {
        //this function will determine what is displayed in the input
        return this.$store.state.global.language;
      },
      set(value) {
        //this function will run whenever the input changes
        this.$store.dispatch(globalTypes.SET_LANGUAGE, value);
        this.$i18n.locale = value;
      }
    }
  }
};
</script>
<style scoped lang="scss">
.locale-changer {
  position: fixed;
  bottom: 10px;
  left: 10px;
  z-index: 1000;
}
</style>