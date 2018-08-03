<template>
    <div id="app" class="m-grid m-grid--hor m-grid--root m-page">
        <header-component
                :settings="settings"
                :window_data="window_data"
        >
        </header-component>
        <left-aside-component
                :settings="settings"
                :window_data="window_data"
        >
        </left-aside-component>
    </div>
</template>

<script>
    import axios from 'axios';
    import HeaderComponent from '../components/Header/HeaderComponent';
    import LeftAsideComponent from '../components/LeftAside/LeftAsideComponent';

    export default {
        name: "HomePage",
        components: {
            'header-component' : HeaderComponent,
            'left-aside-component' : LeftAsideComponent
        },
        props: {
            'settings': Object,
            'window_data': Object,
        }
    }
</script>

<style scoped lang="scss">
    p {
        color: red;
    }
</style>

