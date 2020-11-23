___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Local Storage Checker",
  "description": "This template allows you to easily interact with the Local Storage, set, get, remove or check if an item is present!",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "GROUP",
    "name": "group1",
    "displayName": "",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "SELECT",
        "name": "action",
        "displayName": "Action",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "set",
            "displayValue": "set"
          },
          {
            "value": "get",
            "displayValue": "get"
          },
          {
            "value": "remove",
            "displayValue": "remove"
          },
          {
            "value": "check",
            "displayValue": "check"
          }
        ],
        "simpleValueType": true,
        "help": "Action determines what do you want to do with an item in Local Storage (set an item in Local Storage; get an item from Local Storage; remove an item in Local Storage;  check if the value of an item is already present in Local Storage if the value checked is already present in Local Storage, a dataLayer push is sent with localStorage_check \u003d true)"
      },
      {
        "type": "TEXT",
        "name": "key",
        "displayName": "Key",
        "simpleValueType": true,
        "help": "The Key defined must be added in the Custom Template Permissions before (please see the documentation for more details)"
      },
      {
        "type": "TEXT",
        "name": "value",
        "displayName": "Value",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "action",
            "paramValue": "set",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "TEXT",
        "name": "checkValue",
        "displayName": "Value",
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "action",
            "paramValue": "check",
            "type": "EQUALS"
          }
        ]
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// Enter your template code here.
const log = require('logToConsole');
var createQueue = require('createQueue');
const localStorage = require('localStorage');
const queryPermission = require('queryPermission');
log('data =', data);

const key = data.key;
const value = data.value;
const action = data.action;
const checkValue = data.checkValue;

if (action === 'set'){
  localStorage.setItem(key, value);
  return value;
}

if (action === 'get'){
  localStorage.getItem(key);
  return localStorage.getItem(key);
}

if (action === 'remove'){
  localStorage.removeItem(key);
  return true;
}

if (action === 'check' && localStorage.getItem(key) === checkValue){
  return true;
} else {
  return false;
}

log(action);
log(key);
log(value);
log(checkValue);

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_local_storage",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "internal"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 23/11/2020 à 16:02:46


