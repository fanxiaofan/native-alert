import {
  NativeModules,
} from 'react-native';

import React, {
  Component
} from 'react';


const NativeAlert = NativeModules.FFTBridge;

export default {
  showAlert(title,message){
    NativeAlert.showAlert(title,message);
  }
};
