import globalSettings from '../../settings';
import * as globalTypes from '../../types/global';
import axios from 'axios';

const state = {
  processing: {
    update_settings: false,
    update_translations: false,
  },
  window_data: {
    window_width: window.innerWidth,
    window_height: window.innerHeight,
    scrollX_position: window.scrollX,
    scrollY_position: window.scrollY,
  },
  settings: {
    name_app: '',
    url_img_logo_vertical: '',
    url_img_logo_horizontal: '',
    dismiss_secs_alerts: '',
  },
  translations: {},
  language: navigator.language,
};
const getters = {
  [globalTypes.PROCESSING]: state => {
    let processing = false
    for(let index in state.processing ){
      if( state.processing[index] == true) {
        processing = true
      }
    }
    return processing;
  },    
  [globalTypes.WINDOW_DATA]: state => {
    return state.window_data;
  },
  [globalTypes.SETTINGS]: state => {
    return state.settings;
  },
  [globalTypes.TRANSLATIONS]: state => {
    return state.translations;
  },
  [globalTypes.LANGUAGE]: state => {
    return state.language;
  },     
};
const mutations = {
  [globalTypes.STOP_PROCESSING_GET_SETTINGS]: (state) => {
    state.processing.update_settings = false;
  },
  [globalTypes.START_PROCESSING_GET_SETTINGS]: (state) => {
    state.processing.update_settings = true;
  }, 
  [globalTypes.STOP_PROCESSING_GET_TRANSLATIONS]: (state) => {
    state.processing.update_translations = false;
  },
  [globalTypes.START_PROCESSING_GET_TRANSLATIONS]: (state) => {
    state.processing.update_translations = true;
  },      
  [globalTypes.MUTATE_WINDOW_DATA_RESIZE]: (state) => {
    state.window_data.window_width = window.innerWidth;
    state.window_data.window_height = window.innerHeight;
  },
  [globalTypes.MUTATE_WINDOW_DATA_SCROLL]: (state) => {
    state.window_data.scrollX_position = window.scrollX;
    state.window_data.scrollY_position = window.scrollY;
  }, 
  [globalTypes.MUTATE_SETTINGS]: (state, {apiResponse}) => {
    state.settings = apiResponse.result;
  }, 
  [globalTypes.MUTATE_TRANSLATIONS]: (state, {apiResponse}) => {
    state.translations = apiResponse.result;
  },
  [globalTypes.MUTATE_LANGUAGE]: (state, payload) => {
    // console.log(payload);
    state.language = payload;
  },  
};
const actions = {
  [globalTypes.UPDATE_WINDOW_DATA_RESIZE]: ({ commit }) => {
    commit(globalTypes.MUTATE_WINDOW_DATA_RESIZE);
  },
  [globalTypes.UPDATE_WINDOW_DATA_SCROLL]: ({ commit }) => {
    commit(globalTypes.MUTATE_WINDOW_DATA_SCROLL);
  },   
  [globalTypes.GET_SETTINGS]: ({ commit }) => {
    commit(globalTypes.START_PROCESSING_GET_SETTINGS);
    return new Promise((resolve, reject) => {
      axios
        .get(
          globalSettings.http+'api/get_settings',
          {headers: { 'Content-Type': 'application/json' }}
        ).then(response => {
          // eslint-disable-next-line
          // console.log('Response... settings...!!!', response);
          commit(globalTypes.MUTATE_SETTINGS, {apiResponse: response.data} );
          resolve(response.data);
        })
        .catch(error => {
          reject(error);
        })
        .finally(() => {
          commit(globalTypes.STOP_PROCESSING_GET_SETTINGS);
        })
    })
  },  
  [globalTypes.GET_TRANSLATIONS]: ({ commit }) => {
    // Todo
    // api/get_translations
    commit(globalTypes.START_PROCESSING_GET_TRANSLATIONS);
    return new Promise((resolve, reject) => {
      axios
        .get(
          globalSettings.http+'api/get_translations',
          {headers: { 'Content-Type': 'application/json' }}
        ).then(response => {
          // eslint-disable-next-line
          // console.log('Response... settings...!!!', response);
          commit(globalTypes.MUTATE_TRANSLATIONS, {apiResponse: response.data} );
          resolve(response.data);
        })
        .catch(error => {
          reject(error);
        })
        .finally(() => {
          commit(globalTypes.STOP_PROCESSING_GET_TRANSLATIONS);
        })
    })    
  }, 
  [globalTypes.SET_LANGUAGE]: ({ commit }, payload) => {
    // console.log(payload);
    commit(globalTypes.MUTATE_LANGUAGE, payload);
  },      
};

export default {
  state,
  mutations,
  actions,
  getters
}