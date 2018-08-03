# Symfony-4-Supplier-&-Product-Manager

First steps in the development of the Frontend of a SPA application "supplier and Product Manager".

## Phases of Development

// Todo

## Summary Symfony component`s to use

* Twig Component, `composer require twig`
* Asset Component, `composer require symfony/asset`
* WebPack Encore, `composer require encore`

## Summary of the components of the Webpack to use

* Npm.js Component, `npm install @symfony/webpack-encore --save-dev`
* jQuery, `npm i jquery`
* Ajv: Another JSON Schema Validator, `npm i ajv`
* Ajv-keywords, `npm i ajv-keywords`
* Sass-loader Component, `npm install sass-loader --only=dev`
* Node Sass Component, `npm install node-sass --dev`
* Vue plugin, `npm install --save vue`
* Bootstrap-Vue, `npm i bootstrap-vue`
* Vue-loader, `npm i vue-loader`
* Vue-template-compiler, `npm i vue-template-compiler`
* Axios, `npm i axios`
* Vue-router, `npm i vue-router`
* font-awesome, `npm i font-awesome`

## Summary Console command`s to be used

* `npm run watch`

--------------------------------------------------------------------------------------------

## 1.Installation of basic symfony components for the template.

--------------------------------------------------------------------------------------------

1. For the view we will use *Twig*, so we will install your component using the following command:
`composer require twig`

> Each url in vue should have a reference in the symfony routing that uses the [templates/base.html.twig](../../templates/base.html.twig).

2. As an example we will use [templates/default/index.html.twig](../../templates/default/index.html.twig)

_[templates/default/index.html.twig](../../templates/default/index.html.twig)_
```html
{% extends 'base.html.twig' %}
{% block body %}
    <div id="app"></div>
{% endblock %}
```

(Source: [https://symfony.com/doc/current/page_creation.html#rendering-a-template](https://symfony.com/doc/current/page_creation.html#rendering-a-template))

3. How we need to reference the entries, **js** [public/build/js/main.js](../../public/build/js/main.js), and **css** 
[public/build/css/app.css](../../public/build/css/app.css) and [public/build/js/main.css](../../public/build/js/main.css), within the template we will install the **Asset Component** using the console command:

```bash
composer require symfony/asset
```

4. Next, we will add to the base template [templates/base.html.twig](../../templates/base.html.twig), the links to our 
entries **js** and **css**.

_[templates/base.html.twig](../../templates/base.html.twig)_
```html
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>{% block title %}Welcome!{% endblock %}</title>
        {# add next line .............................................................................. #}
            <!-- Todo -->
        {# add add previous line line ................................................................. #}
        {% block stylesheets %}{% endblock %}
    </head>
    <body>
        {% block body %}{% endblock %}
        {# add next line .............................................................................. #}
            <!-- Todo -->
        {# add add previous line line ................................................................. #}
        {% block javascripts %}{% endblock %}
    </body>
</html>
```

5. Now, we must install the **Profiler Componente** to use the **toolbar Debug**, and the **server component**, in 
order to launch our **local server**, through the console commands:

```bash
composer require --dev profiler
composer require server --dev
```

We will launch the **Local Server** using the console command:

```bash
php bin/console server:run
```

In order to see the results, we will click on [http://127.0.0.1:8000](http://127.0.0.1:8000).


--------------------------------------------------------------------------------------------

## 2.Installation of **WebPack Encore**

--------------------------------------------------------------------------------------------

( Source: [https://symfony.com/doc/current/frontend/encore/installation.html](https://symfony.com/doc/current/frontend/encore/installation.html) )

1. We are using **Symfony Flex** for the project, so we will initialize our project for **Webpack Encore** through:

```bash
composer require encore
```

2. Before, you need to make sure you have **Node.js** installed, otherwise you can access [https://nodejs.org/en/](https://nodejs.org/es/) and download it for your installation.

3. Next, we will install **Npm.js**, using the command:

```bash
npm install @symfony/webpack-encore --save-dev
```

This component will generate a file [webpack.config.js](../../webpack.config.js), and add the directories [assets/]
(assets/) and [node_modules/](../../node_modules/) to [.gitignore](../../.gitignore).

--------------------------------------------------------------------------------------------

## 3.Installation and Configuration of **SASS**

--------------------------------------------------------------------------------------------

( Source: [https://symfony.com/doc/current/frontend/encore/css-preprocessors.html](https://symfony.com/doc/current/frontend/encore/css-preprocessors.html) )

1. After configuring the compilation process in **Webpack**, so that the system recognizes the result of the compilation process of the static files.

For before, you must add the dependencies that we need when we use **SASS** with the following command.

```bash
npm install sass-loader node-sass --only=dev
```

2. Next we will configure the file [webpack.config.js](webpack.config.js) with the following directives.

_[webpack.config.js](webpack.config.js)_
```diff
    // uncomment to define the assets of the project
    // .addEntry('js/app', './assets/js/app.js')
++   .addEntry('js/main', './assets/js/main.js')
    // .addStyleEntry('css/app', './assets/css/app.scss')
++   .addStyleEntry('css/app', './assets/css/app.scss')
    // uncomment if you use Sass/SCSS files
    // .enableSassLoader()
++    .enableSassLoader()
```

To activate **Sass-Loader**, which is the **SASS Reader**, and indicate the location of the inputs and outputs of the components **js** and **css**. Indicating `.addEntry ('js/app', './assets/js/app.js')` for the compilation of **js** and `.addStyleEntry (' css/app ',' ./assets/css/app.scss') `for the **css**.

3. In the next step, we will create our stylesheet [assets/css/app.scss](assets/css/app.scss) using **SASS**. This sheet will be transpiled to **CSS**.

_[assets/css/app.scss](assets/css/app.scss)_
```scss
$acceVerde: #84a640;
$acceAzul: #396696;
h1 {
    color: $acceVerde;
    s {
        color: $acceAzul;
    }
}
```

4. Next, we add this line `import '../css/app.scss';` in [assets/js/app.js](assets/js/app.js) to be able to compile **Sass** in **css**.

_[assets/js/app.js](assets/js/app.js)_
```js
import '../css/app.scss';
```

5. Now, we can access [http://127.0.0.1:8000](http://127.0.0.1:8000) again expecting to see our changes in the template, but we will find two **404 errors** corresponding to the files [assets/css/app.css](assets/css/app.css) and [assets/js/app.js](assets/js/app.js) that we just included in our base template.

To correct the errors, we must execute the following command that will generate the files from those created in the folders  [assets/css/app.css](assets/css/app.css) and [assets/js/app.js](assets/js/app.js).

```bash
npm run watch
```

**Note:** If we launch a `npm run dev -watch` thread, the system will recognize the changes we make to the files and will regenerate the files that are linked in our template so that the changes are available.

6. Now we can launch the server again using `php bin/console server:run` and access [http://127.0.0.1:8000](http://127.0.0.1:8000) to see the changes referred to in [assets/css/app.scss](assets/css/app.scss).

--------------------------------------------------------------------------------------------

## 4.Installation and configuration of **Bootstrap-Vue**

--------------------------------------------------------------------------------------------

( Source: [https://symfony.com/doc/current/frontend/encore/vuejs.html](https://symfony.com/doc/current/frontend/encore/vuejs.html) )
 
1. First it is necessary to install **Vue**, then add the **Bootstrap-Vue** (Bootstrap-4) plugin.

```bash
npm install --save vue
npm i bootstrap-vue
```

> In addition we will include the following components of Vue.

* Vue plugin, `npm install --save vue`
* Vue-loader, `npm i vue-loader`
* Vue-template-compiler, `npm i vue-template-compiler`
* Vue-router, `npm i vue-router`

2. We will modify webpack.config to add some additional plugins.

_[webpack.config.js](../../webpack.config.js)_
```diff
var Encore = require('@symfony/webpack-encore');
++ const { VueLoaderPlugin } = require('vue-loader');

Encore
    // the project directory where compiled assets will be stored
    .setOutputPath('public/build/')
    // the public path used by the web server to access the previous directory
    .setPublicPath('/build')
    // the public path you will use in Symfony's asset() function - e.g. asset('build/some_file.js')
    .setManifestKeyPrefix('build/')

    .cleanupOutputBeforeBuild()
    .enableSourceMaps(!Encore.isProduction())

    // the following line enables hashed filenames (e.g. app.abc123.css)
    .enableVersioning(Encore.isProduction())

    // uncomment to define the assets of the project
    //.addEntry('js/app', './assets/js/main.js')
    .addEntry('js/main', './assets/js/main.js')
    //.addStyleEntry('css/app', './assets/css/app.scss')
    .addStyleEntry('css/app', './assets/css/app.scss')
    // uncomment if you use TypeScript
    //.enableTypeScriptLoader()

    // uncomment if you use Sass/SCSS files
    //.enableSassLoader()
    .enableSassLoader()
    // uncomment for legacy applications that require $/jQuery as a global variable
    //.autoProvidejQuery()
++  .autoProvidejQuery()
    // Enable Vue loader
++ .enableVueLoader()

++  .addPlugin(new VueLoaderPlugin())
;

module.exports = Encore.getWebpackConfig();
```

3. In the next step, we will modify our stylesheet [assets/css/app.scss](../../assets/css/app.scss) by importing the 
**Bootstrap** library. 

_[assets/css/app.scss](../../assets/css/app.scss)_
```diff
++ @import '~bootstrap/dist/css/bootstrap.css'
++ @import '~bootstrap-vue/dist/bootstrap-vue.css'
$acceVerde: #84a640;
$acceAzul: #396696;
h1 {
    color: $acceVerde;
    s {
        color: $acceAzul;
    }
}
```

**Note**: This sheet will be compiled to **CSS**.

4. Next, we add these lines in [assets/js/app.js](../../assets/js/main.js).

_[assets/js/main.js](../../assets/js/main.js)_
```diff
++ import Vue from 'vue'
++ import BootstrapVue from 'bootstrap-vue'
++ Vue.use(BootstrapVue);

import '../css/app.scss';
```

5. Now, we launch **loader-sass** via `npm run watch`, and the **server** `php bin/console server:run` so we can see 
the results by clicking [http://127.0.0.1:8000](http://127.0.0.1:8000).

--------------------------------------------------------------------------------------------

## 5.First Component

--------------------------------------------------------------------------------------------

_[assets/js/main.js](../../assets/js/main.js)_
```js
/* Sass ******************************************************************************/
import '../css/app.scss';

/* Vue *******************************************************************************/
import Vue from 'vue';
import App from './App.vue';

//bootstrapVue
import BootstrapVue from 'bootstrap-vue'
Vue.use(BootstrapVue);
import jQuery from 'jquery';
import bootstrap from 'bootstrap';
import fontAwesomeIcon from './utils/fa.config.js';
//.bootstrapVue

//vue axios
// https://github.com/paweljw/bookstore-frontend/tree/master/src
// https://paweljw.github.io/2017/09/vue.js-front-end-app-part-3-authentication/
// Todo
// Vue.use(Axios, axiosConfig)
//.vue axios

//modules and types
// Todo
//.modules and types

//vue-router
// Todo
//.vue-router

Vue.config.productionTip = false

/**
 * Create a fresh Vue Application instance
 */

new Vue({
    render: h => h(App),
    // Todo
}).$mount('#app')
```

_[assets/js/App.vue](../../assets/js/App.vue)_
```vue
<template>
    <div id="app">
        <p>{{name}}</p>
    </div>
</template>

<script>
    export default {
        name: "App",
        data() {
            return {
                name:  "hello vue",
            };
        },
    }
</script>

<style scoped lang="scss">
    p {
        color: red;
    }
</style>
```
--------------------------------------------------------------------------------------------

## 6.Notes

--------------------------------------------------------------------------------------------

> Recently there have been problems with the dependencies, check the content of package.json.

> Also install the following additional packages.


* jQuery, `npm i jquery`
* Ajv: Another JSON Schema Validator, `npm i ajv`
* Ajv-keywords, `npm i ajv-keywords`
* Vue plugin, `npm install --save vue`
* Bootstrap-Vue, `npm i bootstrap-vue`
* Vue-loader, `npm i vue-loader`
* Vue-template-compiler, `npm i vue-template-compiler`
* Axios, `npm i axios`
* Vue-router, `npm i vue-router`
* font-awesome, `npm i font-awesome`