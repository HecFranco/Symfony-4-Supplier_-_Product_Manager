import globalSettings from '../../settings';
import * as types from '../../types/global';
import axios from 'axios';

const state = {
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
  processing: false
};
const getters = {
  [types.WINDOW_DATA]: state => {
    return state.window_data;
  },
  [types.SETTINGS]: state => {
    return state.settings;
  },
  [types.PROCESSING]: state => {
    return state.processing;
  },  
};
const mutations = {
  [types.MUTATE_WINDOW_DATA_RESIZE]: (state) => {
    state.window_data.window_width = window.innerWidth;
    state.window_data.window_height = window.innerHeight;
  },
  [types.MUTATE_WINDOW_DATA_SCROLL]: (state) => {
    state.window_data.scrollX_position = window.scrollX;
    state.window_data.scrollY_position = window.scrollY;
  }, 
  [types.MUTATE_SETTINGS]: (state, {apiResponse}) => {
    state.settings = apiResponse.result;
  }, 
  [types.STOP_PROCESSING]: (state) => {
    state.processing = false;
  },
  [types.START_PROCESSING]: (state) => {
    state.processing = true;
  },    
};
const actions = {
  [types.UPDATE_WINDOW_DATA_RESIZE]: ({ commit }) => {
    commit(types.MUTATE_WINDOW_DATA_RESIZE);
  },
  [types.UPDATE_WINDOW_DATA_SCROLL]: ({ commit }) => {
    commit(types.MUTATE_WINDOW_DATA_SCROLL);
  },   
  [types.UPDATE_SETTINGS]: ({ commit }) => {
    commit(types.START_PROCESSING);
    return new Promise((resolve, reject) => {
      axios.get(globalSettings.http+'api/get_settings',
        {headers: { 'Content-Type': 'application/json' }}
      ).then(response => {
        // eslint-disable-next-line
        console.log(response);
        commit(types.MUTATE_SETTINGS, {apiResponse: response.data} );
        resolve(response.data);
        commit(types.STOP_PROCESSING);
      })
      .catch(error => {
        reject(error);
      })
      .finally(() => {
        // commit(globalTypes.mutations.stopProcessing);
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