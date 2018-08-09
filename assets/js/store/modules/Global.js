import globalSettings from '../../settings';
import * as globalTypes from '../../types/global';
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
  [globalTypes.WINDOW_DATA]: state => {
    return state.window_data;
  },
  [globalTypes.SETTINGS]: state => {
    return state.settings;
  },
  [globalTypes.PROCESSING]: state => {
    return state.processing;
  },  
};
const mutations = {
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
  [globalTypes.STOP_PROCESSING]: (state) => {
    state.processing = false;
  },
  [globalTypes.START_PROCESSING]: (state) => {
    state.processing = true;
  },    
};
const actions = {
  [globalTypes.UPDATE_WINDOW_DATA_RESIZE]: ({ commit }) => {
    commit(globalTypes.MUTATE_WINDOW_DATA_RESIZE);
  },
  [globalTypes.UPDATE_WINDOW_DATA_SCROLL]: ({ commit }) => {
    commit(globalTypes.MUTATE_WINDOW_DATA_SCROLL);
  },   
  [globalTypes.UPDATE_SETTINGS]: ({ commit }) => {
    commit(globalTypes.START_PROCESSING);
    return new Promise((resolve, reject) => {
      axios.get(globalSettings.http+'api/get_settings',
        {headers: { 'Content-Type': 'application/json' }}
      ).then(response => {
        // eslint-disable-next-line
        // console.log('Response... settings...!!!', response);
        commit(globalTypes.MUTATE_SETTINGS, {apiResponse: response.data} );
        resolve(response.data);
        commit(globalTypes.STOP_PROCESSING);
      })
      .catch(error => {
        reject(error);
      })
      .finally(() => {
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