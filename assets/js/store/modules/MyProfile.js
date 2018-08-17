import * as myProfileTypes from '../../types/myProfile';
import * as Authentication from './Authentication';

const state = {
  updateDataUser: {
    firstname: '',
    lastname: '',
    email: '',
    password: '',
  },
};
const getters = {
  [myProfileTypes.USER]: state => {
    return state.updateDataUser;
  },
};
const mutations = {
  // to establish the user's status
  [myProfileTypes.MUTATE_USER_FIRSTNAME]: (state, payload) => {
    state.updateDataUser.firstname = payload;
  },
  [myProfileTypes.MUTATE_USER_LASTNAME]: (state, payload) => {
    state.updateDataUser.lastname = payload;
  },
  [myProfileTypes.MUTATE_USER_EMAIL]: (state, payload) => {
    state.updateDataUser.email = payload;
  },
  [myProfileTypes.MUTATE_USER_PASSWORD]: (state, payload) => {
    state.updateDataUser.password = payload;
  },
};
const actions = {
  [myProfileTypes.UPDATE_USER_FIRSTNAME]: ({ commit }, payload) => {
    commit(updateDataUser.MUTATE_USER_FIRSTNAME, payload);
  },
  [myProfileTypes.UPDATE_USER_LASTNAME]: ({ commit }, payload) => {
    commit(updateDataUser.MUTATE_USER_LASTNAME, payload);
  },
  [myProfileTypes.UPDATE_USER_EMAIL]: ({ commit }, payload) => {
    commit(updateDataUser.MUTATE_USER_EMAIL, payload);
  },
  [myProfileTypes.UPDATE_USER_PASSWORD]: ({ commit }, payload) => {
    commit(updateDataUser.MUTATE_USER_PASSWORD, payload);
  },
};
export default {
  state,
  mutations,
  actions,
  getters
}