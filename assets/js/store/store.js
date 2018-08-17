import Vue from 'vue';
import Vuex from 'vuex';

import global from './modules/Global';
import authentication from './modules/Authentication';
import myProfile from './modules/MyProfile';

Vue.use(Vuex);

export const store = new Vuex.Store({
    modules: {
      global,
      authentication,
      myProfile
    }
});