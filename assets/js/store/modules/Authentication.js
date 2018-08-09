import * as authTypes from '../../types/authentication';
import * as globalTypes from '../../types/global';
import axios from 'axios';
import globalSettings from '../../settings';

const state = {
  user: {
      firstname: '',
      lastname: '',
      email: '',
      password: ''
  },
  logged: !!window.localStorage.getItem('_token'),
  auth_type: ''
};
const getters = {
  [authTypes.USER]: state => {
    return state.user;
  }, 
  [authTypes.LOGGED]: state => {
    return state.logged;
  }, 
  [authTypes.TYPE_AUTHENTICATION]: state => {
    return state.auth_type;
  }, 
};
const mutations = {
  // to establish the user's status
  [authTypes.MUTATE_USER_FIRSTNAME]: (state, payload) => {
    state.user.firstname = payload;
  },
  [authTypes.MUTATE_USER_LASTNAME]: (state, payload) => {
    state.user.lastname = payload;
  },
  [authTypes.MUTATE_USER_EMAIL]: (state, payload) => {
    state.user.email = payload;
  },
  [authTypes.MUTATE_USER_PASSWORD]: (state, payload) => {
    state.user.password = payload;
  },
  [authTypes.MUTATE_LOGGED]: (state) => {
    state.logged = true;
  },
  [authTypes.MUTATE_UNLOGGED]: (state) => {
    state.logged = false;
  },
  [authTypes.MUTATE_LOGIN]: (state) => {
    //
  },    
  [authTypes.MUTATE_TYPE_AUTHENTICATION]: (state, payload) => {
    state.auth_type = payload;
  },
};
const actions = {
  [authTypes.UPDATE_USER_FIRSTNAME]: ({commit}, payload) => {
    commit(authTypes.MUTATE_USER_FIRSTNAME, payload);
  },
  [authTypes.UPDATE_USER_LASTNAME]: ({commit}, payload) => {
    commit(authTypes.MUTATE_USER_LASTNAME, payload);
  },
  [authTypes.UPDATE_USER_EMAIL]: ({commit}, payload) => {
    commit(authTypes.MUTATE_USER_EMAIL, payload);
  },
  [authTypes.UPDATE_USER_PASSWORD]: ({commit}, payload) => {
    commit(authTypes.MUTATE_USER_PASSWORD, payload);
  },
  [authTypes.UPDATE_LOGGED]: ({commit}) => {
    commit(authTypes.MUTATE_LOGGED);
  },
  [authTypes.UPDATE_UNLOGGED]: ({commit}) => {
    commit(authTypes.MUTATE_UNLOGGED);
  }, 
  [authTypes.ACTION_LOGIN]: ({commit}) => {
    commit(globalTypes.START_PROCESSING); 
    axios
        .post(
          globalSettings.http + "api/login_check",
          {
            username: state.user.email ,
            password: state.user.password 
          },
          { headers: { "Content-Type": "application/json" } }
        )
        .then(response => { 
          // save token and refreh token
          if (
            response.data.token != undefined &&
            response.data.refresh_token != undefined
          ) {
            window.localStorage.setItem(
              "token",
              response.data.token
            );
            window.localStorage.setItem(
              "refresh_token",
              response.data.refresh_token
            );
            commit(authTypes.MUTATE_LOGGED);
            const jwtDecode = require("jwt-decode");
            this.user = jwtDecode(response.data.token);
            commit(globalTypes.STOP_PROCESSING);
          }          
        });
  },            
  [authTypes.UPDATE_TYPE_AUTHENTICATION]: ({commit}, payload) => {
    commit(authTypes.MUTATE_TYPE_AUTHENTICATION, payload)
  },
};

export default {
  state,
  mutations,
  actions,
  getters
}