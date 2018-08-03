## Summary Plugins and Components
1. [Nprogress](#nprogress)
2. [Vee Validate]()
3. [Vue Notifications]()

---------------------------------------------------------------------------------------

<div style="text-align: right"><a href="#summary-plugins-and-components">Return to <strong>Summary Steps</strong></a></div>

---------------------------------------------------------------------------------------
### Animate.scss

```bash
npm i animate.scss
```

### NProgress

---------------------------------------------------------------------------------------

Slim progress bars for Ajax'y applications. Inspired by Google, YouTube, and Medium

Needs two resources in the template.

```html
<!-- ... -->
<head>
<!--begin::NProgress CSS -->
    <link rel="stylesheet" href="https://unpkg.com/nprogress@0.2.0/nprogress.css">
<!--end::NProgress CSS -->
<!-- ... -->
</head>
<body>
<!-- ... -->
    <!--begin::NProgress JS -->
        <script src="https://unpkg.com/nprogress@0.2.0/nprogress.js"></script>
    <!--end::NProgress JS -->
<!-- ... -->
</body>
```

It will be activated when the route is loaded. 

Configuring it within [assets/js/router/index.js](../../assets/js/router/index.js).

_[assets/js/router/index.js](../../assets/js/router/index.js)_
```js
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
        NProgress.start()
    }
    next()
})
//.beforeResolve route change

//afterEach route change
router.afterEach((to, from) => {
    // Complete the animation of the route progress bar.
    NProgress.done()
})
export default router;
//.afterEach route change
```

##### Tutorial : 
        * [Add Loading Indicators to Your Vue.js Application](https://scotch.io/tutorials/add-loading-indicators-to-your-vuejs-application)
##### Other sources : 
        * [need bar & spinner to be different colors #121](https://github.com/rstacruz/nprogress/issues/121)
##### Official sources : 
        * [NProgress.js](http://ricostacruz.com/nprogress/)
        * [Github](https://github.com/rstacruz/nprogress/)
        
<div style="text-align: right"><a href="#summary-plugins-and-components">Return to <strong>Summary Steps</strong></a></div>

---------------------------------------------------------------------------------------

### Vee Validate

---------------------------------------------------------------------------------------

```bash
npm install vee-validate
```

_[assets/js/main.js](../../assets/js/main.js)_
```js
import Vue from 'vue';
import VeeValidate from 'vee-validate';

Vue.use(VeeValidate);
```

```html
<input v-validate="'required|email'" name="email" type="text">
<span>{{ errors.first('email') }}</span>
```
```html
<input v-validate="'required|email'" type="email" name="email">
<input v-validate="{ required: true, email: true }" type="email" name="email">

```

```html
<input v-validate="'alpha'" type="text" name="username">
<input v-validate="{ alpha: true }" type="text" name="username">
```

```html
<input v-validate="'required|min:6'" type="password" name="password">
<input v-validate="{ required: true, min: 6 }" type="password" name="password">
```
##### Official sources : 
        * [Vee Validate](https://baianat.github.io/vee-validate/)
        * [Github](https://github.com/rstacruz/nprogress/)

<div style="text-align: right"><a href="#summary-plugins-and-components">Return to <strong>Summary Steps</strong></a></div>

---------------------------------------------------------------------------------------

### Vue Notifications

---------------------------------------------------------------------------------------

To install it, you need use the command:

```bash
npm i vue-notifications --save
```

##### Official sources :
        * [](https://se-panfilov.github.io/vue-notifications/)
        * [GitHub](https://github.com/se-panfilov/vue-notifications)
