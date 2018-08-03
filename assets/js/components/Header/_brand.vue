<template>
    <!-- BEGIN: Brand -->
    <div class="m-stack__item m-brand  m-brand--skin-dark">
        <div class="m-stack m-stack--ver m-stack--general">
            <div class="m-stack__item m-stack__item--middle m-brand__logo">
                <a href="index.html" class="m-brand__logo-wrapper">
                <img alt="" :src="url_img_logo" class="img_logo"/>
                </a>
            </div>
            <div class="m-stack__item m-stack__item--middle m-brand__tools">
                <!-- BEGIN: Left Aside Minimize Toggle -->
                <a 
                    id="m_aside_left_minimize_toggle"
                    v-on:click="leftAsideToggler()"
                    class="m-brand__icon m-brand__toggler m-brand__toggler--left m--visible-desktop-inline-block"
                >
                <span></span>
                </a>
                <!-- END -->
                <!-- BEGIN: Responsive Aside Left Menu Toggler -->
                <a 
                    id="m_aside_left_offcanvas_toggle" 
                    v-on:click="leftAsideTogglerResponsive()" 
                    class="m-brand__icon m-brand__toggler m-brand__toggler--left m--visible-tablet-and-mobile-inline-block"
                >          
                <span></span>
                <!--  -->
                </a>
                <!-- END -->
                <!-- BEGIN: Responsive Header Menu Toggler -->
                <a id="m_aside_header_menu_mobile_toggle" href="javascript:;" class="m-brand__icon m-brand__toggler m--visible-tablet-and-mobile-inline-block">
                <span></span>
                </a>
                <!-- END -->
                <!-- BEGIN: Topbar Toggler -->
                <a 
                    id="m_aside_header_topbar_mobile_toggle" 
                    v-on:click="topbarToggler()" 
                    class="m-brand__icon m--visible-tablet-and-mobile-inline-block"
                >
                <i class="flaticon-more"></i>
                </a>
                <!-- BEGIN: Topbar Toggler -->
            </div>
        </div>
    </div>
    <!-- END: Brand -->
</template>

<script>
    export default {
        name: 'Brand',
        props: {
            'url_img_logo': String
        },
        methods: {
            topbarToggler: function(){
                document.getElementsByTagName('body')[0].classList.toggle('m-topbar--on');
            },
            leftAsideToggler: function(){
                document.getElementsByTagName('body')[0].classList.toggle('m-aside-left--minimize');
                document.getElementsByTagName('body')[0].classList.toggle('m-brand--minimize');                
                document.getElementById('m_aside_left_minimize_toggle').classList.toggle('m-brand__toggler--active');                
            },
            leftAsideTogglerResponsive: function(){
                document.getElementsByTagName('body')[0].classList.toggle('m-aside-left--minimize');
                document.getElementsByTagName('body')[0].classList.toggle('m-brand--minimize');
                document.getElementsByTagName('body')[0].classList.toggle('m-aside-left--on');
                document.getElementById('m_aside_left_offcanvas_toggle').classList.toggle('m-brand__toggler--active');
                document.getElementById('m_aside_left').classList.toggle('m-aside-left--on');
            }         
        }
    }
</script>
<style scoped lang="scss">
    .img_logo{
        max-height: 50px;
        max-width: 170px;
        left: -15px;
        position: relative;
    }
</style>