___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "PostHog",
  "categories": [
    "ANALYTICS",
    "SESSION_RECORDING",
    "EXPERIMENTATION"
  ],
  "brand": {
    "id": "github.com_PostHog",
    "displayName": "PostHog"
  },
  "description": "Load the PostHog JavaScript Web SDK and send events, identify calls and opt-in\/opt-out changes to PostHog. Use the Initialize tag once per page, then use the other tag types on your own triggers.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "tagType",
    "displayName": "Tag type",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "init",
        "displayValue": "Initialize PostHog"
      },
      {
        "value": "capture",
        "displayValue": "Capture event"
      },
      {
        "value": "identify",
        "displayValue": "Identify"
      },
      {
        "value": "alias",
        "displayValue": "Alias"
      },
      {
        "value": "reset",
        "displayValue": "Reset"
      },
      {
        "value": "optIn",
        "displayValue": "Opt in to capturing"
      },
      {
        "value": "optOut",
        "displayValue": "Opt out of capturing"
      }
    ],
    "simpleValueType": true,
    "help": "Use <b>Initialize PostHog</b> once, on a trigger that fires before every other PostHog tag. Set it as the setup tag of your other PostHog tags so they always run after the SDK is ready."
  },
  {
    "type": "GROUP",
    "name": "initGroup",
    "displayName": "PostHog project",
    "groupStyle": "NO_ZIPPY",
    "subParams": [
      {
        "type": "TEXT",
        "name": "projectToken",
        "displayName": "Project API key",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Found in <a href=\"https://us.posthog.com/settings/project\">your project settings</a>. It starts with <code>phc_</code> and is safe to expose in the browser."
      },
      {
        "type": "SELECT",
        "name": "region",
        "displayName": "Region",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "us",
            "displayValue": "US Cloud (us.i.posthog.com)"
          },
          {
            "value": "eu",
            "displayValue": "EU Cloud (eu.i.posthog.com)"
          },
          {
            "value": "custom",
            "displayValue": "Custom host (reverse proxy or self-hosted)"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "us"
      },
      {
        "type": "TEXT",
        "name": "customHost",
        "displayName": "Custom host",
        "simpleValueType": true,
        "valueValidators": [
          {
            "type": "NON_EMPTY"
          }
        ],
        "help": "Full origin, for example <code>https://ph.example.com</code>. This template cannot load the SDK from a custom host, because Google Tag Manager requires script URLs to be declared up front. Load the SDK with a Custom HTML tag and leave <b>Load the SDK</b> unchecked.",
        "enablingConditions": [
          {
            "paramName": "region",
            "paramValue": "custom",
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "CHECKBOX",
        "name": "loadSdk",
        "checkboxText": "Load the SDK from PostHog",
        "simpleValueType": true,
        "defaultValue": true,
        "help": "Leave this on unless the PostHog snippet is already on the page. Only available for US and EU Cloud.",
        "enablingConditions": [
          {
            "paramName": "region",
            "paramValue": "custom",
            "type": "NOT_EQUALS"
          }
        ]
      }
    ],
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "initOptions",
    "displayName": "Capture options",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "TEXT",
        "name": "defaults",
        "displayName": "Defaults version",
        "simpleValueType": true,
        "defaultValue": "2025-05-24",
        "help": "Pins SDK defaults to a date so future SDK releases do not change your data silently. See <a href=\"https://posthog.com/docs/libraries/js/config\">configuration docs</a>."
      },
      {
        "type": "CHECKBOX",
        "name": "autocapture",
        "checkboxText": "Autocapture clicks and form interactions",
        "simpleValueType": true,
        "defaultValue": true
      },
      {
        "type": "CHECKBOX",
        "name": "capturePageview",
        "checkboxText": "Capture pageviews automatically",
        "simpleValueType": true,
        "defaultValue": true,
        "help": "Turn this off if you would rather fire a Capture event tag named <code>$pageview</code> on your own trigger."
      },
      {
        "type": "CHECKBOX",
        "name": "sessionRecording",
        "checkboxText": "Record sessions",
        "simpleValueType": true,
        "defaultValue": false,
        "help": "Session replay must also be enabled in your PostHog project settings."
      },
      {
        "type": "SELECT",
        "name": "personProfiles",
        "displayName": "Person profiles",
        "macrosInSelect": false,
        "selectItems": [
          {
            "value": "identified_only",
            "displayValue": "Identified only (recommended)"
          },
          {
            "value": "always",
            "displayValue": "Always"
          },
          {
            "value": "never",
            "displayValue": "Never"
          }
        ],
        "simpleValueType": true,
        "defaultValue": "identified_only",
        "help": "<a href=\"https://posthog.com/docs/data/persons\">Person profiles</a> affect billing and anonymous event handling."
      },
      {
        "type": "CHECKBOX",
        "name": "optOutByDefault",
        "checkboxText": "Start opted out of capturing",
        "simpleValueType": true,
        "defaultValue": false,
        "help": "Use with a consent banner. Fire an <b>Opt in to capturing</b> tag once the visitor consents."
      }
    ],
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "init",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "eventName",
    "displayName": "Event name",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "For example <code>signup completed</code>. PostHog conventionally uses lowercase names with spaces.",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "capture",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "eventProperties",
    "displayName": "Event properties",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Property",
        "name": "key",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Value",
        "name": "value",
        "type": "TEXT"
      }
    ],
    "newRowButtonText": "Add property",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "capture",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "distinctId",
    "displayName": "Distinct ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Your own stable identifier for the logged-in user, usually from a data layer variable.",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "identify",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "setProperties",
    "displayName": "Person properties to set",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Property",
        "name": "key",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Value",
        "name": "value",
        "type": "TEXT"
      }
    ],
    "newRowButtonText": "Add property",
    "help": "Overwrites the property every time this tag fires.",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "identify",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "setOnceProperties",
    "displayName": "Person properties to set once",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Property",
        "name": "key",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Value",
        "name": "value",
        "type": "TEXT"
      }
    ],
    "newRowButtonText": "Add property",
    "help": "Only written the first time, for values such as the original signup date.",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "identify",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "aliasId",
    "displayName": "Alias",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "A second ID to attach to the current person. See <a href=\"https://posthog.com/docs/product-analytics/identify\">identify docs</a>.",
    "enablingConditions": [
      {
        "paramName": "tagType",
        "paramValue": "alias",
        "type": "EQUALS"
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "enableLogging",
    "checkboxText": "Log to the console in preview mode",
    "simpleValueType": true,
    "defaultValue": false
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const callInWindow = require('callInWindow');
const copyFromWindow = require('copyFromWindow');
const injectScript = require('injectScript');
const logToConsole = require('logToConsole');
const makeTableMap = require('makeTableMap');
const queryPermission = require('queryPermission');

const CLOUD_HOSTS = {
  us: {api: 'https://us.i.posthog.com', assets: 'https://us-assets.i.posthog.com'},
  eu: {api: 'https://eu.i.posthog.com', assets: 'https://eu-assets.i.posthog.com'}
};

const log = function(message) {
  if (data.enableLogging) {
    logToConsole('[PostHog] ' + message);
  }
};

const fail = function(message) {
  log(message);
  data.gtmOnFailure();
};

// makeTableMap returns undefined for an empty table, and the SDK expects an object.
const tableToObject = function(rows) {
  return makeTableMap(rows || [], 'key', 'value') || {};
};

const apiHost = function() {
  if (data.region === 'custom') {
    return data.customHost;
  }
  return CLOUD_HOSTS[data.region].api;
};

const initPostHog = function() {
  const config = {
    api_host: apiHost(),
    defaults: data.defaults,
    autocapture: data.autocapture,
    capture_pageview: data.capturePageview,
    disable_session_recording: !data.sessionRecording,
    person_profiles: data.personProfiles,
    opt_out_capturing_by_default: data.optOutByDefault
  };

  callInWindow('posthog.init', data.projectToken, config);
  log('initialized against ' + config.api_host);
  data.gtmOnSuccess();
};

const runInit = function() {
  if (data.region === 'custom' || !data.loadSdk) {
    // The SDK is loaded elsewhere, so wait for it rather than injecting a script.
    if (!copyFromWindow('posthog')) {
      return fail('posthog is not on the page. Load the PostHog snippet with a Custom HTML tag first.');
    }
    return initPostHog();
  }

  const scriptUrl = CLOUD_HOSTS[data.region].assets + '/static/array.js';
  if (!queryPermission('inject_script', scriptUrl)) {
    return fail('No permission to inject ' + scriptUrl);
  }

  injectScript(scriptUrl, initPostHog, function() {
    fail('Failed to load ' + scriptUrl);
  }, 'posthog');
};

const runCommand = function() {
  if (!copyFromWindow('posthog')) {
    return fail('posthog is not on the page yet. Set the Initialize PostHog tag as the setup tag of this tag.');
  }

  if (data.tagType === 'capture') {
    callInWindow('posthog.capture', data.eventName, tableToObject(data.eventProperties));
    log('captured ' + data.eventName);
  } else if (data.tagType === 'identify') {
    callInWindow(
      'posthog.identify',
      data.distinctId,
      tableToObject(data.setProperties),
      tableToObject(data.setOnceProperties)
    );
    log('identified ' + data.distinctId);
  } else if (data.tagType === 'alias') {
    callInWindow('posthog.alias', data.aliasId);
    log('aliased ' + data.aliasId);
  } else if (data.tagType === 'reset') {
    callInWindow('posthog.reset');
    log('reset');
  } else if (data.tagType === 'optIn') {
    callInWindow('posthog.opt_in_capturing');
    log('opted in');
  } else if (data.tagType === 'optOut') {
    callInWindow('posthog.opt_out_capturing');
    log('opted out');
  } else {
    return fail('Unknown tag type ' + data.tagType);
  }

  data.gtmOnSuccess();
};

if (data.tagType === 'init') {
  runInit();
} else {
  runCommand();
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://us-assets.i.posthog.com/static/array.js"
              },
              {
                "type": 1,
                "string": "https://eu-assets.i.posthog.com/static/array.js"
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
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "key"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"},
                  {"type": 1, "string": "execute"}
                ],
                "mapValue": [
                  {"type": 1, "string": "posthog"},
                  {"type": 8, "boolean": true},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": false}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "key"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"},
                  {"type": 1, "string": "execute"}
                ],
                "mapValue": [
                  {"type": 1, "string": "posthog.init"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "key"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"},
                  {"type": 1, "string": "execute"}
                ],
                "mapValue": [
                  {"type": 1, "string": "posthog.capture"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "key"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"},
                  {"type": 1, "string": "execute"}
                ],
                "mapValue": [
                  {"type": 1, "string": "posthog.identify"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "key"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"},
                  {"type": 1, "string": "execute"}
                ],
                "mapValue": [
                  {"type": 1, "string": "posthog.alias"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "key"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"},
                  {"type": 1, "string": "execute"}
                ],
                "mapValue": [
                  {"type": 1, "string": "posthog.reset"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "key"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"},
                  {"type": 1, "string": "execute"}
                ],
                "mapValue": [
                  {"type": 1, "string": "posthog.opt_in_capturing"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {"type": 1, "string": "key"},
                  {"type": 1, "string": "read"},
                  {"type": 1, "string": "write"},
                  {"type": 1, "string": "execute"}
                ],
                "mapValue": [
                  {"type": 1, "string": "posthog.opt_out_capturing"},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": false},
                  {"type": 8, "boolean": true}
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
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created by PostHog. Source and issues: https://github.com/PostHog/posthog-gtm-template
