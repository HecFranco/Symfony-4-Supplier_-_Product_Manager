<template>
    <!-- begin:: Page -->
    <div class="m-grid m-grid--hor m-grid--root m-page" style="height: 100vh;">
        <div
            class="m-grid__item m-grid__item--fluid m-grid m-grid--ver-desktop m-grid--desktop m-grid--tablet-and-mobile m-grid--hor-tablet-and-mobile m-login m-login--1 m-login--signin"
            id="m_login">
            <div class="m-grid__item m-grid__item--order-tablet-and-mobile-2 m-login__aside">
                <div class="m-stack m-stack--hor m-stack--desktop">
                    <div class="m-stack__item m-stack__item--fluid">
                        <div class="m-login__wrapper" style="padding-top:26px;">
                            <div class="m-login__logo">
                                <a href="#">
                                    <img :src="urlImgLogo()" class="logo-img">
                                </a>
                            </div>
                            <div
                                id="block-form-authentication"
                                class="m-login__signin"
                                style="display:block"
                            >
                                <div class="m-login__head" v-if="type == 'signin'">
                                    <!--begin::signin head -->
                                    <h3 class="m-login__title">
                                        {{ $t("authentication.sign_in_to_admin") }}
                                    </h3>
                                    <!--end::signin head -->
                                </div>
                                <div class="m-login__head" v-if="type == 'signup'">
                                    <!--begin::signup head -->
                                        <h3 class="m-login__title" >
                                            {{ $t("authentication.sign_up") }}
                                        </h3>
                                        <div class="m-login__desc" >
                                        {{ $t("authentication.enter_your_details_to_create_your_account") }}
                                        </div>
                                    <!--end::signup head -->
                                </div>
                                <div class="m-login__head" v-if="type == 'forgetPassword'">
                                    <!--begin::forgetPassword head -->
                                        <h3 class="m-login__title" >
                                            {{ $t("authentication.forget_password") }}
                                        </h3>
                                        <div class="m-login__desc">
                                            {{ $t("authentication.enter_your_email_to_reset_your_password") }}
                                        </div>
                                    <!--end::forgetPassword head -->
                                </div>
                                <!--begin::form -->
                                <div class="m-login__form m-form" @keydown.enter="handleSubmit">
                                    <!--begin::signin inputs -->
                                        <div v-if="type == 'signin'">
                                            <div class="form-group m-form__group">
                                                <input v-model="user_auth.email" class="form-control m-input" type="text" placeholder="Email" name="email" autocomplete="off">
                                            </div>
                                            <div class="form-group m-form__group">
                                                <input v-model="user_auth.password" class="form-control m-input m-login__form-input--last" type="password" placeholder="Password" name="password">
                                            </div>
                                            <div class="row m-login__form-sub">
                                                <div class="col m--align-left">
                                                    <label class="m-checkbox m-checkbox--focus">
                                                        <input type="checkbox" name="remember">
                                                        {{ $t("authentication.remember_me") }}
                                                        <span></span>
                                                    </label>
                                                </div>
                                                <div class="col m--align-right">
                                                    <router-link
                                                            id="m_login_forget_password"
                                                            class="m-link"
                                                            :to="{ name: 'forgetPasswordPage' }"
                                                            v-on:click.native="signupAnimation('signup')"
                                                    >
                                                        {{ $t("authentication.forget_password") }}
                                                    </router-link>
                                                </div>
                                            </div>
                                        </div>
                                    <!--end::signin inputs -->
                                    <!--begin::signup inputs -->
                                        <div v-if="type == 'signup'">
                                            <div class="form-group m-form__group">
                                                <input v-model="user_auth.firstname" class="form-control m-input" type="text" placeholder="Firstname" name="firstname">
                                            </div>
                                            <div class="form-group m-form__group">
                                                <input v-model="user_auth.lastname" class="form-control m-input" type="text" placeholder="Lastname" name="lastname">
                                            </div>
                                            <div class="form-group m-form__group">
                                                <input v-model="user_auth.email" class="form-control m-input" type="text" placeholder="Email" name="email" autocomplete="off">
                                            </div>
                                            <div class="form-group m-form__group">
                                                <input v-model="user_auth.password" class="form-control m-input" type="password" placeholder="Password" name="password">
                                            </div>
                                            <div class="form-group m-form__group">
                                                <input v-model="user_auth.rpassword" class="form-control m-input m-login__form-input--last" type="password" placeholder="Confirm Password" name="rpassword">
                                            </div>
                                        </div>
                                    <!--end::signup inputs -->
                                    <!--begin::forgetPassword inputs -->
                                        <div v-if="type == 'forgetPassword'">
                                            <div class="form-group m-form__group">
                                                <input v-model="user_auth.email" class="form-control m-input" type="text" placeholder="Email" name="email" id="m_email" autocomplete="off">
                                            </div>
                                        </div>
                                    <!--end::forgetPassword inputs -->
                                    <!--begin::submit signin -->
                                        <div class="m-login__form-action" v-if="type == 'signin'">
                                            <button
                                                v-on:click="handleSubmitSignin"
                                                id="m_login_signin_submit"
                                                class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air"
                                            >
                                                {{ $t("authentication.sign_in") }}
                                            </button>
                                        </div>
                                    <!--end::submit signin -->
                                    <!--begin::submit signup -->
                                        <div class="m-login__form-action" v-if="type == 'signup'">
                                            <button
                                                v-on:click="handleSubmitSignup"
                                                id="m_login_signup_submit"
                                                class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air"
                                            >
                                                {{ $t("authentication.sign_up") }}
                                            </button>
                                            <router-link
                                                id="m_login_signup_cancel"
                                                class="btn btn-outline-focus  m-btn m-btn--pill m-btn--custom"
                                                :to="{ name: 'loginPage' }"
                                                v-on:click.native="signupAnimation('signup')"
                                            >
                                                {{ $t("authentication.cancel") }}
                                            </router-link>
                                        </div>
                                    <!--end::submit signup -->
                                    <!--begin::submit forgetpassword -->
                                        <div class="m-login__form-action" v-if="type == 'forgetPassword'">
                                            <button
                                                v-on:click="handleSubmitForgetPassword"
                                                id="m_login_forget_password_submit"
                                                class="btn btn-focus m-btn m-btn--pill m-btn--custom m-btn--air"
                                            >
                                                {{ $t("authentication.request") }}
                                            </button>
                                            <router-link
                                                id="m_login_forget_password_cancel"
                                                class="btn btn-outline-focus m-btn m-btn--pill m-btn--custom"
                                                :to="{ name: 'loginPage' }"
                                                v-on:click.native="signupAnimation('signup')"
                                            >
                                                {{ $t("authentication.cancel") }}
                                            </router-link>
                                        </div>
                                    <!--end::submit forgetpassword -->
                                </div>
                                <!--end::form -->
                            </div>
                        </div>
                    </div>
                    <div class="m-stack__item m-stack__item--center" v-if="type != 'signup'">
                        <div class="m-login__account">
                            <span class="m-login__account-msg">{{ $t("authentication.dont_have_an_account_yet") }}</span>
                            <router-link
                                id="m_login_signup"
                                class="m-link m-link--focus m-login__account-link"
                                :to="{ name: 'signupPage' }"
                                v-on:click.native="signupAnimation('signup')"
                            >
                                {{ $t("authentication.sign_up") }}
                            </router-link>
                        </div>
                    </div>
                </div>
            </div>
            <div
                v-if="getWindowWidth() > '1200'"
                class="m-grid__item m-grid__item--fluid m-grid m-grid--center m-grid--hor m-grid__item--order-tablet-and-mobile-1 m-login__content"
                style="background-image: url(./assets/app/media/img/bg/bg-4.jpg)"
            >
                <div class="m-grid__item m-grid__item--middle">
                    <h3 class="m-login__welcome">
                        {{ $t("authentication.app_manager") }}
                    </h3>
                    <p class="m-login__msg">
                        {{ $t("authentication.supplier_and_product_manager", {controller : type }) }}
                    </p>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    /* NProgress *************************************************************************/
    var NProgress  = require('../libraries/nprogress.js');

    import axios from 'axios';
    import { setTimeout } from 'timers';
    // Component Show Notifications
    import VueNotifications from 'vue-notifications'

    export default {
        name: 'AuthenticationPage',
        data() {
            return {
                user_auth : {
                    firstname: '',
                    lastname: '',
                    email: '',
                    password: ''
                },
                user: {}
            }
        },
        // Notifications
        notifications: {
            showSuccessMsg: {
                type: VueNotifications.types.success,
                title: '',
                message: ''
            },
            showInfoMsg: {
                type: VueNotifications.types.info,
                title: '',
                message: ''
            },
            showWarnMsg: {
                type: VueNotifications.types.warn,
                title: '',
                message: ''
            },
            showErrorMsg: {
                type: VueNotifications.types.error,
                title: '',
                message: ''
            }
        },
        // Data from father component
        props: {
            'settings': Object,
            'window_data': Object,
            'type': String
        },
        // Methods
        methods: {
            // Views and Animations
            urlImgLogo: function(){
                // console.log('image loaded...');
                return (this.settings.url_img_logo_vertical !== undefined ) ? this.settings.url_img_logo_vertical.value : null;
            },
            getWindowWidth: function(){
                // console.log('window width loaded...');
                return this.window_data.window_width;
            },
            signupAnimation: function(to){
                console.log('signupAnimation running...');
                var form = document.getElementById('block-form-authentication');
                form.classList.add('flipInX');
                form.classList.add('animated');
                setTimeout(function(){
                    console.log('removing class...');
                    form.classList.remove('flipInX');
                    form.classList.remove('animated');
                }, 700);
            },
            // Send Form
            handleSubmit: function(){/**/},
            handleSubmitSignin: function(){
                NProgress.start();
                NProgress.set(0.4);
                axios
                    .post('http://127.0.0.1:8000/api/login_check',
                        {
                            "username": this.user_auth.email,
                            "password": this.user_auth.password
                        },
                        {headers: { 'Content-Type': 'application/json' }}
                    )
                    .then(response => {
                        // save token and refreh token
                        if(response.data.token != undefined && response.data.refresh_token != undefined){
                            window.localStorage.setItem('token', response.data.token);
                            window.localStorage.setItem('refresh_token', response.data.refresh_token);
                            const jwtDecode = require('jwt-decode');
                            this.user = jwtDecode(response.data.token);
                            this.showSuccessMsg({message: 'User logged', title: ''});
                            // redirect to route
                            this.$router.replace(this.$route.query.redirect || '/home');
                            NProgress.done();
                        }
                    }).catch((error) => {
                        this.showWarnMsg({message: 'User no logged', title: ''});
                        NProgress.done();
                    });
            },
            handleSubmitSignup: function(){
                console.log('Sending form Signup...');
                console.log(this.user_auth);
                NProgress.start();
                NProgress.set(0.4);
                axios
                    .post('http://127.0.0.1:8000/api/signup',
                        {
                            "firstname": this.user_auth.firstname,
                            "lastname": this.user_auth.lastname,
                            "email": this.user_auth.email,
                            "password": this.user_auth.password
                        },
                        {headers: { 'Content-Type': 'application/json' }}
                    )
                    .then(response => {
                        // save token and refreh token
                        if(response.data.token != undefined && response.data.refresh_token != undefined){
                            window.localStorage.setItem('token', response.data.token);
                            window.localStorage.setItem('refresh_token', response.data.refresh_token);
                            // redirect to route
                            this.$router.replace(this.$route.query.redirect || '/home');
                            NProgress.done();
                        }else if(response.data.token == undefined && response.data.result.message != undefined ){
                            // Generate alert to show
                            this.showWarnMsg({message: response.data.result.message, title: ''});
                            NProgress.done();
                        }
                    }).catch((error) => {
                        this.showWarnMsg({message: 'Error in SignUp Process...!!!', title: ''});
                        NProgress.done();
                    });
            },
            handleSubmitForgetPassword: function(){ /**/ },
        },
    }
</script>

<style scoped>
    .logo-img{
        max-width: 120px;
        max-height: 120px;
    }
    .m-login__signin{
        display: block;
    }
</style>