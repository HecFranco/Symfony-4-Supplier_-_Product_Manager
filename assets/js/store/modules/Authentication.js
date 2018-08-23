import axios from 'axios';
import globalSettings from '../../settings';
import * as authTypes from '../../types/authentication';

import * as globalTypes from '../../types/global';

const state = {
  processing: {
    refresh_token: false,
    get_data_user: false,
    get_permissions: false,
    action_login: false,    
  },  
  user: {
    firstname: null,
    lastname: null,
    email: null,
    password: null,
  },
  permissions: {},
  business: {},
  // convert to boolean the _token in localStorage
  logged: !!window.localStorage.getItem('_token'),
  authenticated: null,
  auth_type: null,
};
const getters = {
  [authTypes.PROCESSING]: state => {
    let processing = false
    for(let index in state.processing ){
      if( state.processing[index] == true) {
        processing = true
      }
    }
    return processing;
  },    
  [authTypes.USER]: state => {
    return state.user;
  },
  [authTypes.PERMISSIONS]: state => {
    return state.permissions;
  },
  [authTypes.BUSINESS]: state => {
    return state.business;
  },  
  [authTypes.LOGGED]: state => {
    return state.logged;
  },
  [authTypes.AUTHENTICATED]: state => {
    return state.authenticated;
  },
  [authTypes.TYPE_AUTHENTICATION]: state => {
    return state.auth_type;
  },
};
const mutations = {
  [authTypes.STOP_PROCESSING_REFRESH_TOKEN]: (state) => {
    state.processing.refresh_token = false;
  },
  [authTypes.START_PROCESSING_REFRESH_TOKEN]: (state) => {
    state.processing.refresh_token = true;
  },    
  [authTypes.STOP_PROCESSING_GET_DATA_USER]: (state) => {
    state.processing.get_data_user = false;
  },
  [authTypes.START_PROCESSING_GET_DATA_USER]: (state) => {
    state.processing.get_data_user = true;
  },  
  [authTypes.STOP_PROCESSING_GET_PERMISSIONS]: (state) => {
    state.processing.get_permissions = false;
  },
  [authTypes.START_PROCESSING_GET_PERMISSIONS]: (state) => {
    state.processing.get_permissions = true;
  },           
  [authTypes.STOP_PROCESSING_LOGIN]: (state) => {
    state.processing.action_login = false;
  },
  [authTypes.START_PROCESSING_LOGIN]: (state) => {
    state.processing.action_login = true;
  },     
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
  [authTypes.MUTATE_LOGOUT]: (state) => {
    // console.log('mutation logout working...!!', state);
    window.localStorage.clear();
    state.logged = false;
    state.user = {
      firstname: '',
      lastname: '',
      email: '',
      password: ''
    };
  },
  [authTypes.MUTATE_SET_DATA_USER]: (state, payload) => {
    state.logged = true;
    state.user = payload.user;
  },
  [authTypes.MUTATE_SET_DATA_BUSINESS]: (state, payload) => {
    state.logged = true;
    state.business = payload.business;
  },  
  [authTypes.MUTATE_SET_PERMISSIONS]: (state, payload) => {
    state.logged = true;
    state.permissions = payload.permissions;
  },
  [authTypes.MUTATE_AUTHENTICATED]: (state, payload) => {
    state.authenticated = true;
  },
  [authTypes.MUTATE_TYPE_AUTHENTICATION]: (state, payload) => {
    state.auth_type = payload;
  },
};
const actions = {
  [authTypes.UPDATE_USER_FIRSTNAME]: ({ commit }, payload) => {
    commit(authTypes.MUTATE_USER_FIRSTNAME, payload);
  },
  [authTypes.UPDATE_USER_LASTNAME]: ({ commit }, payload) => {
    commit(authTypes.MUTATE_USER_LASTNAME, payload);
  },
  [authTypes.UPDATE_USER_EMAIL]: ({ commit }, payload) => {
    commit(authTypes.MUTATE_USER_EMAIL, payload);
  },
  [authTypes.UPDATE_USER_PASSWORD]: ({ commit }, payload) => {
    commit(authTypes.MUTATE_USER_PASSWORD, payload);
  },
  [authTypes.GET_DATA_USER]: ({ commit, dispatch }) => {
    commit(authTypes.START_PROCESSING_GET_DATA_USER);    
    return new Promise((resolve, reject) => {
      axios
        .get(
          globalSettings.http + 'api/auth/get_data_user',
          { headers: { 'Authorization': 'Bearer ' + window.localStorage.getItem('_token') } }
        )
        .then(response => {
          // console.log('get_data_user...!!!', response.data.result);
          commit(authTypes.MUTATE_SET_DATA_USER, { user: response.data.result });
          resolve(response);
        })
        .catch(error => {
          if (error.response.data.message === 'Expired JWT Token') {
            dispatch(authTypes.REFRESH_TOKEN);
          }
          // we capture the error in the component
          reject(error);
        })
        .finally(() => {
          commit(authTypes.STOP_PROCESSING_GET_DATA_USER);          
        })
    });
  },
  [authTypes.GET_DATA_BUSINESS]: ({ commit, dispatch }) => {   
    return new Promise((resolve, reject) => {
      axios
        .get(
          globalSettings.http + 'api/auth/get_data_business',
          { headers: { 'Authorization': 'Bearer ' + window.localStorage.getItem('_token') } }
        )
        .then(response => {
          // console.log('get_data_business...!!!', response.data.result);
          commit(authTypes.MUTATE_SET_DATA_BUSINESS, { business: response.data.result });
          resolve(response);
        })
        .catch(error => {
          if (error.response.data.message === 'Expired JWT Token') {
            dispatch(authTypes.REFRESH_TOKEN);
          }
          // we capture the error in the component
          reject(error);
        })
        .finally(() => {        
        })
    });
  },  
  [authTypes.GET_PERMISSIONS]: ({ commit, dispatch }) => {
    commit(authTypes.START_PROCESSING_GET_PERMISSIONS);    
    return new Promise((resolve, reject) => {
      axios
        .get(
          globalSettings.http + 'api/auth/get_permissions',
          { headers: { 'Authorization': 'Bearer ' + window.localStorage.getItem('_token') } }
        )
        .then(response => {
          // console.log('get_permissions...!!!', response.data.result);
          commit(authTypes.MUTATE_SET_PERMISSIONS, { permissions: response.data.result });
          resolve(response);
        })
        .catch(error => {
          // Todo
          // we capture the error in the component
          reject(error);
        })
        .finally(() => {
          commit(authTypes.STOP_PROCESSING_GET_PERMISSIONS);          
        })
    });
  },  
  [authTypes.REFRESH_TOKEN]: ({ commit, dispatch }) => {
    commit(authTypes.START_PROCESSING_REFRESH_TOKEN);    
    return new Promise((resolve, reject) => {
      axios
        .post(
          globalSettings.http + 'api/token/refresh',
          {
            refresh_token: window.localStorage['_refresh_token'],
          },
          { headers: { 'Content-Type': 'application/json' } }
        )
        .then(response => {
          window.localStorage['_refresh_token'] = response.data['refresh_token'];
          window.localStorage['_token'] = response.data['token'];
          dispatch(authTypes.GET_DATA_USER);
          dispatch(authTypes.GET_PERMISSIONS);
          dispatch(authTypes.GET_DATA_BUSINESS);
          commit(authTypes.MUTATE_AUTHENTICATED);
          resolve(response);
        })
        .catch(error => {
          if (error.response.data.message === 'Expired JWT Token') {
            dispatch(authTypes.LOGOUT);
          }
          // we capture the error in the component
          reject(error);
        })
        .finally(() => {
          commit(authTypes.STOP_PROCESSING_REFRESH_TOKEN);          
        })
    });
  },
  [authTypes.LOGOUT]: ({ commit }) => {
    commit(authTypes.MUTATE_LOGOUT);
  },
  [authTypes.LOGIN]: ({ commit, dispatch }) => {
    commit(authTypes.START_PROCESSING_LOGIN);
    // console.log('mutate login working...!!!');
    return new Promise((resolve, reject) => {
      axios
        .post(
          globalSettings.http + "api/login_check",
          {
            username: state.user.email,
            password: state.user.password
          },
          { headers: { "Content-Type": "application/json" } }
        )
        .then(response => {
          // save token and refreh token
          // console.log('action login working...', response);
          if (
            response.data.token != undefined &&
            response.data.refresh_token != undefined
          ) {
            window.localStorage.setItem(
              "_token",
              response.data.token
            );
            window.localStorage.setItem(
              "_refresh_token",
              response.data.refresh_token
            );
            dispatch(authTypes.GET_DATA_USER);
          }
          resolve(response);
        })
        .catch(error => {
          // we capture the error in the component
          reject(error);
        })
        .finally(() => {
          commit(authTypes.STOP_PROCESSING_LOGIN);
        })
    })
  },
  [authTypes.UPDATE_TYPE_AUTHENTICATION]: ({ commit }, payload) => {
    commit(authTypes.MUTATE_TYPE_AUTHENTICATION, payload)
  },
};
export default {
  state,
  mutations,
  actions,
  getters
}