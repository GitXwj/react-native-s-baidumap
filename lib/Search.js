import {NativeModules, DeviceEventEmitter, NativeEventEmitter} from 'react-native';

const BaiduMapSearch = NativeModules.BaiduMapSearch;
const baiduMapSearchEmitter = Ios
    ? new NativeEventEmitter(BaiduMapSearch)
    : DeviceEventEmitter;

//POI检索
export const searchPoi = {
  //POI城市内检索（关键字检索）
  searchInCity: (city, keyword, pageNum = 10) => {
    let emitter = null;
    return new Promise((resolve,reject)=>{
      try {
        if (!city || !keyword) {
          const error = 'searchInCity city / keyword参数不能为空';
          reject(error);
        }
        BaiduMapSearch.searchInCity(city, keyword, pageNum);
      } catch (e) {
        reject(e);
      }
      if (!emitter) {
        emitter = baiduMapSearchEmitter.addListener('BaiduPoiSearch', resp => {
          console.warn('BaiduPoiSearch', resp);
          resolve(resp);
          emitter && emitter.remove();
        });

      }
    });



  },
  /**
   * 周边检索
   * options = {
   * latitude,
   * longitude,
   * keyword,
   * pageNum,
   * radius
   * }
   */
  searchNearby: options => {
    let emitter = null;

    return new Promise((resolve, reject)=>{
      try {
        if (!options.latitude || !options.longitude) {
          const error = 'searchNearby latitude / longitude参数不能为空';
          resolve(error);
        }
        BaiduMapSearch.searchNearby(options);
      } catch (e) {
        resolve(e);
      }
      emitter = baiduMapSearchEmitter.addListener('BaiduPoiSearch', resp => {
        console.warn('BaiduPoiSearch', resp);
        resolve(resp);
        emitter && emitter.remove();
      });
    });
  },

};

//地点检索-输入提示检索
export const suggestion = {
  requestSuggestion: (city = '', keyword = '') => {
    let emitter = null;
    return new Promise((resolve, reject)=>{
      try {
        if (!keyword) {
          const error = 'requestSuggestion keyword参数不能为空';
          return Promise.reject(error);
        }
        BaiduMapSearch.requestSuggestion(city, keyword);
      } catch (e) {
        resolve(e);
      }
      emitter = baiduMapSearchEmitter.addListener('BaiduRequestSuggestion', resp => {
        console.warn('BaiduRequestSuggestion', resp);
        resolve(resp);
        emitter && emitter.remove();
      });

    });
  }
};
