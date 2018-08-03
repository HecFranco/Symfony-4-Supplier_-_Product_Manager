<template>
	<div class="locale-changer">
		<select v-model="$i18n.locale">
			<option v-for="(lang, i) in langs" :key="`Lang${i}`" :value="lang">{{ lang }}</option>
		</select>
	</div>
</template>

<script>
    export default {
        name: 'LocaleChangerComponent',
        data () {
            return { langs: ['es-ES', 'en'] }
        }
    }
</script>
<style scoped lang="scss">
	.locale-changer{
		position: fixed;
		bottom: 10px;
		left: 10px;
		z-index: 1000;
	}
</style>