<template>
    <!-- BEGIN: Header -->
		<header id="m_header" class="m-grid__item m-header"  m-minimize-offset="200" m-minimize-mobile-offset="200" >
			<div class="m-container m-container--fluid m-container--full-height">
				<div class="m-stack m-stack--ver m-stack--desktop">
				    <brand-component></brand-component>
					<div class="m-stack__item m-stack__item--fluid m-header-head" id="m_header_nav">
						<horizontal-menu-component></horizontal-menu-component>
                        <topbar-component></topbar-component>
					</div>
				</div>
			</div>
		</header>
    <!-- BEGIN: Header -->
</template>

<script>
    import Brand from './_brand.vue';
    import HorizontalMenu from './_horizontal_menu.vue';
    import Topbar from './_topbar.vue';
    export default {
        name: 'HeaderComponent',
        components: {
            'brand-component' : Brand,
            'horizontal-menu-component' : HorizontalMenu,
            'topbar-component' : Topbar
        },
		methods: {
            urlImgLogo(){
                console.log(this.$store.state.global.settings.url_img_logo_horizontal.value);
                return 
                    (this.$store.state.global.settings.url_img_logo_horizontal.value !== undefined ) 
                    ? this.$store.state.global.settings.url_img_logo_horizontal.value : null;
            },
            getWindowWidth(){
                return this.$store.state.global.window_data.window_width;
            },
        },
        created () {
            // We use eventlistener because vue has no event of its own for resizing and scrolling
            window.addEventListener('resize', this.getWindowWidth);    
        },
        mounted () {
        }
    }
    // window.localStorage.removeItem('_token');
</script>
<style scoped lang="scss">
    #m_header{
        z-index: 999999;
    }
</style>