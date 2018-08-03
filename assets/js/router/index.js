import Vue from 'vue';
import Router from 'vue-router'
Vue.use(Router);

var NProgress  = require('../libraries/nprogress.js');

//types, pages and components
import HomePage from '../pages/HomePage';
import AuthenticationPage from '../pages/AuthenticationPage';
//.types and components

//configure the router
const router = new Router({
    mode: 'history',
    routes: [
        {
            path: '/',
            redirect:
            { 
                name: 'loginPage'
            },
            name: 'indexPage',
            component: AuthenticationPage,
            meta: { Auth: false, title: 'Login'},
            props : {
                type: 'signin'
            }
        },
        {
            path: '/login',
            name: 'loginPage',
            component: AuthenticationPage,
            meta: { Auth: false, title: 'Login'},
            props : {
                type: 'signin'
            }
        },
        {
            path: '/signup',
            name: 'signupPage',
            component: AuthenticationPage,
            meta: { Auth: false, title: 'Signup'},
            props : {
                type: 'signup'
            }
        },
        {
            path: '/forget-password',
            name: 'forgetPasswordPage',
            component: AuthenticationPage,
            meta: { Auth: false, title: 'Forget Password'},
            props : {
                type: 'forgetPassword'
            }
        },
        {
            path: '/home',
            name: 'homePage',
            component: HomePage,
            meta: { Auth: true, title: 'Home' },
        },
    ]
});
//.configure the router

//beforeEach route change
router.beforeEach((to, from, next) => {
    document.title = to.meta.title;
    // check if the route need authentication and the user is auth
    if (to.meta.Auth && ((window.localStorage.token == undefined ) || (window.localStorage.refresh_token == undefined )) ) {
        next({ path: '/login' });
    } else if (!to.meta.Auth && ((window.localStorage.token != undefined ) || (window.localStorage.refresh_token != undefined )) ) {
        next({ path: '/home' }); 
    }
    next();
});
//.beforeEach route change

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