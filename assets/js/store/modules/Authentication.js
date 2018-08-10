import * as authTypes from '../../types/authentication';
import * as globalTypes from '../../types/global';
import axios from 'axios';
import globalSettings from '../../settings';

const state = {
  user: {
    firstname: '',
    lastname: '',
    email: '',
    password: '',
  },
  // convert to boolean the _token in localStorage
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
  [authTypes.MUTATE_LOGOUT]: (state) => {
    console.log('mutation logout working...!!', state);
    window.localStorage.clear();
    state.logged = false;
    state.user = {
      firstname: '',
      lastname: '',
      email: '',
      password: ''
    };
  },
  [authTypes.MUTATE_SET_USER]: (state, payload) => {
    state.logged = true;
    state.user = payload.user;
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
  [authTypes.UPDATE_USER]: ({ commit }) => {
    return new Promise((resolve, reject) => {
      axios
        .get(
          globalSettings.http + 'api/auth/get_data_user',
          { headers: { 'Authorization': 'Bearer ' + window.localStorage.getItem('_token') } }
        )
        .then(response => {
          console.log('getDataUser...!!!', response.data.result);
          commit(authTypes.MUTATE_SET_USER, {user: response.data.result});
          resolve(response);
        })
        .catch(error => {
          // we capture the error in the component
          reject(error);
        })
        .finally(() => {
        })
    });  
  },
  [authTypes.ACTION_LOGOUT]: ({ commit }) => {
    commit(authTypes.MUTATE_LOGOUT);
  },
  [authTypes.ACTION_LOGIN]: ({ commit , dispatch}) => {
    commit(globalTypes.START_PROCESSING);
    console.log('mutate login working...!!!');
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
          console.log('action login working...', response);
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
            dispatch(authTypes.UPDATE_USER);
          }
          resolve(response);
        })
        .catch(error => {
          // we capture the error in the component
          reject(error);
        })
        .finally(() => {

        })
    })
    commit(globalTypes.STOP_PROCESSING);
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