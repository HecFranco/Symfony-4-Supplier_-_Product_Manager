<template>
    <!-- BEGIN: Horizontal Menu -->
        <!--
        <button
                v-if="window_width < '1024'"
                class="m-aside-header-menu-mobile-close  m-aside-header-menu-mobile-close--skin-dark "
                id="m_aside_header_menu_mobile_close_btn"
        >
            <i class="la la-close"></i>
        </button>
        -->
        <div id="m_header_menu" class="m-header-menu m-aside-header-menu-mobile m-aside-header-menu-mobile--offcanvas  m-header-menu--skin-light m-header-menu--submenu-skin-light m-aside-header-menu-mobile--skin-dark m-aside-header-menu-mobile--submenu-skin-dark "  >
            <ul class="m-menu__nav  m-menu__nav--submenu-arrow ">
                <li class="m-menu__item  m-menu__item--submenu m-menu__item--rel"  m-menu-submenu-toggle="click" m-menu-link-redirect="1" aria-haspopup="true">
                    <a  href="javascript:;" class="m-menu__link m-menu__toggle">
                    <i class="m-menu__link-icon flaticon-add"></i>
                    <span class="m-menu__link-text">
                    Actions
                    </span>
                    <i class="m-menu__hor-arrow la la-angle-down"></i>
                    <i class="m-menu__ver-arrow la la-angle-right"></i>
                    </a>
                    <div class="m-menu__submenu m-menu__submenu--classic m-menu__submenu--left">
                        <span class="m-menu__arrow m-menu__arrow--adjust"></span>
                        <ul class="m-menu__subnav">
                            <li class="m-menu__item "  aria-haspopup="true">
                                <a  href="header/actions.html" class="m-menu__link ">
                                <i class="m-menu__link-icon flaticon-file"></i>
                                <span class="m-menu__link-text">
                                Create New Post
                                </span>
                                </a>
                            </li>
                            <li class="m-menu__item "  m-menu-link-redirect="1" aria-haspopup="true">
                                <a  href="header/actions.html" class="m-menu__link ">
                                <i class="m-menu__link-icon flaticon-diagram"></i>
                                <span class="m-menu__link-title">
                                    <span class="m-menu__link-wrap">
                                        <span class="m-menu__link-text">
                                        Generate Reports
                                        </span>
                                        <span class="m-menu__link-badge">
                                            <span class="m-badge m-badge--success">
                                            2
                                            </span>
                                        </span>
                                    </span>
                                </span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="m-menu__item  m-menu__item--submenu m-menu__item--rel"  m-menu-submenu-toggle="click" m-menu-link-redirect="1" aria-haspopup="true">
                    <a  href="javascript:;" class="m-menu__link m-menu__toggle">
                    <i class="m-menu__link-icon flaticon-line-graph"></i>
                    <span class="m-menu__link-text">
                    Reports
                    </span>
                    <i class="m-menu__hor-arrow la la-angle-down"></i>
                    <i class="m-menu__ver-arrow la la-angle-right"></i>
                    </a>
                    <div class="m-menu__submenu  m-menu__submenu--fixed m-menu__submenu--left" style="width:1000px">
                        <span class="m-menu__arrow m-menu__arrow--adjust"></span>
                        <div class="m-menu__subnav">
                            <ul class="m-menu__content">
                                <li class="m-menu__item">
                                    <h3 class="m-menu__heading m-menu__toggle">
                                        <span class="m-menu__link-text">
                                        Finance Reports
                                        </span>
                                        <i class="m-menu__ver-arrow la la-angle-right"></i>
                                    </h3>
                                    <ul class="m-menu__inner">
                                        <li class="m-menu__item "  m-menu-link-redirect="1" aria-haspopup="true">
                                            <a  href="header/actions.html" class="m-menu__link ">
                                            <i class="m-menu__link-icon flaticon-map"></i>
                                            <span class="m-menu__link-text">
                                            Annual Reports
                                            </span>
                                            </a>
                                        </li>
                                        <li class="m-menu__item "  m-menu-link-redirect="1" aria-haspopup="true">
                                            <a  href="header/actions.html" class="m-menu__link ">
                                            <i class="m-menu__link-icon flaticon-user"></i>
                                            <span class="m-menu__link-text">
                                            HR Reports
                                            </span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="m-menu__item">
                                    <h3 class="m-menu__heading m-menu__toggle">
                                        <span class="m-menu__link-text">
                                        Project Reports
                                        </span>
                                        <i class="m-menu__ver-arrow la la-angle-right"></i>
                                    </h3>
                                    <ul class="m-menu__inner">
                                        <li class="m-menu__item "  m-menu-link-redirect="1" aria-haspopup="true">
                                            <a  href="header/actions.html" class="m-menu__link ">
                                            <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                            </i>
                                            <span class="m-menu__link-text">
                                            Coca Cola CRM
                                            </span>
                                            </a>
                                        </li>
                                        <li class="m-menu__item "  m-menu-link-redirect="1" aria-haspopup="true">
                                            <a  href="header/actions.html" class="m-menu__link ">
                                            <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                            </i>
                                            <span class="m-menu__link-text">
                                            Delta Airlines Booking Site
                                            </span>
                                            </a>
                                        </li>
                                        <li class="m-menu__item "  m-menu-link-redirect="1" aria-haspopup="true">
                                            <a  href="header/actions.html" class="m-menu__link ">
                                            <i class="m-menu__link-bullet m-menu__link-bullet--line">
                                            <span></span>
                                            </i>
                                            <span class="m-menu__link-text">
                                            Malibu Accounting
                                            </span>
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    <!-- END: Horizontal Menu -->
</template>

<script>
    export default {
        name: "HorizontalMenu",
        props: {
            'window_width': Number,
        },        
    }
</script>
<style scoped lang="scss">
    /*
    #m_header_menu{
        padding-top:23px;
    }
    */
</style>