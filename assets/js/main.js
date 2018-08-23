/* Begin::SASS ****************************************************************************/
import '../css/app.scss';
/* End::SASS ******************************************************************************/
/* Begin::NProgress ***********************************************************************/
var NProgress = require('./libraries/nprogress.js');
/* End::NProgress *************************************************************************/
/* Begin::Vue *****************************************************************************/
import Vue from 'vue';
import App from './App.vue';
/* End::Vue *******************************************************************************/

/* Begin::bootstrapVue ********************************************************************/
import BootstrapVue from 'bootstrap-vue'
Vue.use(BootstrapVue);
import jQuery from 'jquery';
import bootstrap from 'bootstrap';
import fontAwesomeIcon from './utils/fa.config.js';
/* End::bootstrapVue **********************************************************************/
/* Begin::Vue Axios ***********************************************************************/
// https://github.com/paweljw/bookstore-frontend/tree/master/src
// https://paweljw.github.io/2017/09/vue.js-front-end-app-part-3-authentication/
import VueAxios from 'vue-axios'
import axios from 'axios';
Vue.use(VueAxios, axios)
/* End::Vue Axios *************************************************************************/
/* Begin::vue-router **********************************************************************/
import router from './router/index';
import VueRouter from 'vue-router';
Vue.use(VueRouter);
/* End::vue-router ************************************************************************/
/* Begin::vue-i18n ************************************************************************/
import messages from './translations';
import VueI18n from 'vue-i18n';
Vue.use(VueI18n);
const i18n = new VueI18n({
  locale: navigator.language,
  messages,
});
/* End::vue-i18n **************************************************************************/
/* Begin::VueNotifications ****************************************************************/
import VueNotifications from 'vue-notifications'
import iziToast from 'izitoast'// https://github.com/dolce/iziToast
import 'izitoast/dist/css/iziToast.min.css'
function toast({ title, message, type, timeout, cb }) {
  if (type === VueNotifications.types.warn) type = 'warning'
  return iziToast[type]({ title, message, timeout })
}
const options = {
  success: toast,
  error: toast,
  info: toast,
  warn: toast
}
Vue.use(VueNotifications, options)
/* End::VueNotifications*******************************************************************/
/* Begin::blockui *************************************************************************/
import BlockUI from 'vue-blockui';
Vue.use(BlockUI);
/* End::blockui ***************************************************************************/
/* Begin::Vee-validate ********************************************************************/
import VeeValidate, { Validator } from 'vee-validate';
// To make validator with translations......
import validatorEs from './validator/es';
import validatorEn from './validator/en';
Validator.localize('es', validatorEs);
// To make validator with translations......
Vue.use(VeeValidate);
/* End::Vee-validate **********************************************************************/
/* Begin::Vuex ****************************************************************************/
import { store } from './store/store';
/* End::Vuex ******************************************************************************/
Vue.config.productionTip = false

/***************************************************************************************** /
 * Create a fresh Vue Application instance
 */
const app = new Vue({
  render:
    h => h(App),
  store,
  router,
  i18n,
  // Todo
}).$mount('#app')

