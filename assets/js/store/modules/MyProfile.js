import * as myProfileTypes from '../../types/myProfile';
import * as authTypes from './Authentication';

const state = {
  updateDataUser: {
    firstName: null,
    lastName: null,
    email: null,
    password: null,
    passwordConfirmation: null,
  },
  processing: false,  
};
const getters = {
  [myProfileTypes.USER]: state => {
    return state.updateDataUser;
  },
  [myProfileTypes.PROCESSING]: state => {
    return state.processing;
  },    
};
const mutations = {
  // to establish the user's status
  [myProfileTypes.MUTATE_USER_FIRSTNAME]: (state, payload) => {
    state.updateDataUser.firstName = payload;
  },
  [myProfileTypes.MUTATE_USER_LASTNAME]: (state, payload) => {
    state.updateDataUser.lastName = payload;
  },
  [myProfileTypes.MUTATE_USER_EMAIL]: (state, payload) => {
    state.updateDataUser.email = payload;
  },
  [myProfileTypes.MUTATE_USER_PASSWORD]: (state, payload) => {
    state.updateDataUser.password = payload;
  },
  [myProfileTypes.MUTATE_USER_PASSWORD_CONFIRMATION]: (state, payload) => {
    state.updateDataUser.passwordConfirmation = payload;
  },
  [myProfileTypes.MUTATE_USER]: (state, user) => {
    state.updateDataUser = user;
  },
  [myProfileTypes.STOP_PROCESSING]: (state) => {
    state.processing = false;
  },
  [myProfileTypes.START_PROCESSING]: (state) => {
    state.processing = true;
  },   
};
const actions = {
  [myProfileTypes.UPDATE_USER_FIRSTNAME]: ({ commit }, payload) => {
    commit(myProfileTypes.MUTATE_USER_FIRSTNAME, payload);
  },
  [myProfileTypes.UPDATE_USER_LASTNAME]: ({ commit }, payload) => {
    commit(myProfileTypes.MUTATE_USER_LASTNAME, payload);
  },
  [myProfileTypes.UPDATE_USER_EMAIL]: ({ commit }, payload) => {
    commit(myProfileTypes.MUTATE_USER_EMAIL, payload);
  },
  [myProfileTypes.UPDATE_USER_PASSWORD]: ({ commit }, payload) => {
    commit(myProfileTypes.MUTATE_USER_PASSWORD, payload);
  },
  [myProfileTypes.INITIALIZE_USER]: ({ commit }, user) => {
    commit(myProfileTypes.MUTATE_USER, user);
  },
};
export default {
  state,
  mutations,
  actions,
  getters
}