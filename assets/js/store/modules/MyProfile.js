import * as myProfileTypes from '../../types/myProfile';

const state = {
  updateDataUser: {
    firstName: '',
    lastName: '',
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
  [myProfileTypes.MUTATE_USER]: (state, user) => {
    state.updateDataUser = user;
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