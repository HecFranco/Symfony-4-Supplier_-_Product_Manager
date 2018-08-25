import axios from 'axios';
import globalSettings from '../../settings';

import * as myProfileTypes from '../../types/myProfile';
import * as authTypes from './Authentication';

const state = {
  processing: {
    sendFormDataUser: false,
  },  
  updateDataUser: {
    firstname: null,
    lastname: null,
    email: null,
    birthdate: null,
    image: {
      url: null,
      name: null
    },
    password: null,
    passwordConfirmation: null,
  },
};
const getters = {
  [myProfileTypes.USER]: state => {
    return state.updateDataUser;
  },
  [myProfileTypes.PROCESSING]: state => {
    let processing = false
    for(let index in state.processing ){
      if( state.processing[index] == true) {
        processing = true
      }
    }
    return processing;
  },    
};
const mutations = {
  [myProfileTypes.STOP_PROCESSING_SEND_FORM_DATA_USER]: (state) => {
    state.processing.sendFormDataUser = false;
  },
  [myProfileTypes.START_PROCESSING_SEND_FORM_DATA_USER]: (state) => {
    state.processing.sendFormDataUser = true;
  },  
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
  [myProfileTypes.MUTATE_USER_BIRTHDATE]: (state, payload) => {
    state.updateDataUser.birthdate = payload;
  },  
  [myProfileTypes.MUTATE_USER_IMAGE_URL]: (state, payload) => {
    state.updateDataUser.image.url = payload;
  }, 
  [myProfileTypes.MUTATE_USER_IMAGE_NAME]: (state, payload) => {
    state.updateDataUser.image.name = payload;
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
  [myProfileTypes.MUTATE_DATA_USER] : (state) => {
    // Todo
  },   
};
const actions = {
  /* Begin::Synchronize form ************************************************************/
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
  [myProfileTypes.UPDATE_USER_PASSWORD_CONFIRMATION]: ({ commit }, payload) => {
    commit(myProfileTypes.MUTATE_USER_PASSWORD_CONFIRMATION, payload);
  },  
  [myProfileTypes.UPDATE_USER_BIRTHDATE]: ({ commit }, payload) => {
    commit(myProfileTypes.MUTATE_USER_BIRTHDATE, payload);
  },   
  /* End::Synchronize form **************************************************************/  
  [myProfileTypes.INITIALIZE_USER]: ({ commit }, user) => {
    commit(myProfileTypes.MUTATE_USER, user);
  },
  [myProfileTypes.SEND_FORM_DATA_USER]: ({ commit }, payload) => {
    // console.log('mutate login working...!!!');
    return new Promise((resolve, reject) => {
      axios
        .post(
          globalSettings.http + 'api/auth/update_data_user',
          {
            firstname: state.updateDataUser.firstname,
            lastname: state.updateDataUser.lastname,
            email: state.updateDataUser.email,
            birthdate: state.updateDataUser.birthdate,
            image: state.updateDataUser.image,
            password: state.updateDataUser.password            
          },          
          { headers: { 'Authorization': 'Bearer ' + window.localStorage.getItem('_token') } }
        )      
        .then(response => {
          // we capture the error in the component
          resolve(response);
        })
        .catch(error => {
          // we capture the error in the component
          reject(error);
        })
        .finally(() => {
          // Todo
        })
    })
  },  
};
export default {
  state,
  mutations,
  actions,
  getters
}