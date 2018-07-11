import {
  NativeModules,
} from 'react-native';

import React, {
  Component
} from 'react';


const NativeAlert = NativeModules.FFTBridge;

export function showAlert(title,message,sure='确定',cancel,sureCallBack=(result)=>{
  console.warn(result);
},cancelCallBack){
    NativeAlert.showAlert(title,message,sure,cancel,sureCallBack,cancelCallBack);
    console.warn(title + ' ' + message);
}

export function printDate(date1,date2,callback=(error,result)=>{

}) {
    return NativeAlert.printDate(date1,date2,callback);
}
