import Vue from 'vue';
import Router from 'vue-router'
Vue.use(Router);

// Libraries Progress used to transitions between pages
var NProgress  = require('../libraries/nprogress.js');

//types, pages and components
import AuthenticationPage from '../pages/AuthenticationPage';
//.types and components

//configure the router
const router = new Router({
    mode: 'history',
    routes: [
        {
            path: '/login',
            name: 'loginPage',
            component: AuthenticationPage,
            meta: { Auth: false, title: 'Login'},
            props:{
                type_auth: "signIn"
            }
        },
        {
            path: '/signup',
            name: 'signupPage',
            component: AuthenticationPage,
            meta: { Auth: false, title: 'Signup'},
            props:{
                type_auth: "signUp"
            }            
        },
        {
            path: '/forget-password',
            name: 'forgetPasswordPage',
            component: AuthenticationPage,
            meta: { Auth: false, title: 'Forget Password'},
            props:{
                type_auth: "forgetPassword"
            }            
        },
    ]
});
//.configure the router        

/*
 * NProgress Loading ...
 * https://scotch.io/tutorials/add-loading-indicators-to-your-vuejs-application
 * The following libraries need to be added :
 * - <link href="https://unpkg.com/nprogress@0.2.0/nprogress.css" rel="stylesheet" />
 * - <script src="https://unpkg.com/nprogress@0.2.0/nprogress.js"></script>
 */
//beforeResolve route change
router.beforeResolve((to, from, next) => {
    // If this isn't an initial page load.
    if (to.name) {
        // Start the route progress bar.
        NProgress.start();
    }
    next()
})
//.beforeResolve route change

//afterEach route change
router.afterEach((to, from) => {
    // Complete the animation of the route progress bar.
    NProgress.done();
})
export default router;
//.afterEach route change

// Todo : Loading system https://scotch.io/tutorials/add-loading-indicators-to-your-vuejs-application