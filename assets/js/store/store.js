import Vue from 'vue';
import Vuex from 'vuex';

import global from './modules/Global';
import authentication from './modules/Authentication';

Vue.use(Vuex);

export const store = new Vuex.Store({
    modules: {
      global,
      authentication
    }
});