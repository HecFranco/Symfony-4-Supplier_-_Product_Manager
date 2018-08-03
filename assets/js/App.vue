<template v-on:mousemove="updateCoordinates">
    <div>
        <router-view
                :settings="settings"
                :window_data="window_data"
        ></router-view>
        <locale-changer-component></locale-changer-component>
    </div>
</template>

<script>
    import axios from 'axios';
    import LocaleChangerComponent from './components/LocaleChanger/LocaleChangerComponent';

    const BASE_URL = 'http://localhost:3333';
    // const url = `${BASE_URL}/api/battles/public`;
    // https://auth0.com/blog/vuejs2-authentication-tutorial/

    export default {
        name: "App",
        components: {
            'locale-changer-component' : LocaleChangerComponent,
        },
        data() {
            return {
                name:  '',
                settings: {
                    dismiss_secs_alerts: {
                        description: '',
                        value: '5'
                    }
                },
                window_data: {
                    window_width: window.innerWidth,
                    window_height: window.innerHeight,
                    scrollX_position: window.scrollX,
                    scrollY_position: window.scrollY,
                    positionX: window.scrollX,
                    positionY: window.scrollY,                 
                },
                user: window.localStorage.identity,
            };
        },
        methods: {
            updateCoordinates: function(event){
                this.window_data.positionX = event.clientX;
                this.window_data.positionY = event.clientY;
                // console.log(this.window_data.positionX,' - ',this.window_data.positionY);
            },
            handleScroll () {
                this.window_data.scrollX_position = window.scrollX;
                this.window_data.scrollY_position = window.scrollY;
                // console.log(this.window_data.scrollX_position,' - ',this.window_data.scrollY_position);
            },
            handleSize () {
                this.window_data.window_width = window.innerWidth;
                this.window_data.window_height = window.innerHeight;
                console.log(this.alert);
                // console.log(this.window_data.window_width,' - ',this.window_data.window_height);
            },         
        },
        created () {
            // We use eventlistener because vue has no event of its own for resizing and scrolling
            window.addEventListener('scroll', this.handleScroll);
            window.addEventListener('resize', this.handleSize); 
        },
        mounted () {
            axios
                .get('http://127.0.0.1:8000/api/get_settings',
                    {headers: { 'Content-Type': 'application/json' }}
                )
                .then(response => {
                    response.data;
                    this.settings = response.data.result;
                    // console.log(response.data.result);
                });
        },        
        updated (){
            if (window.localStorage._token && window.localStorage._refresh_token) {
                this.$router.replace(this.$route.query.redirect || '/home')
            }
        },        
        destroyed () {
            window.removeEventListener('scroll', this.handleScroll);
        }
    }
</script>

<style scoped lang="scss">
    p {
        color: red;
    }
</style>

