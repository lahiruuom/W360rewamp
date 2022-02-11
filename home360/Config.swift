//
//  Config.swift
//  H360 iOS App
//
//  Created by Lahiru Munasinghe on 2020-12-22.
//

import UIKit

public struct Config {
    
    struct API {
        
        enum LIVE {
            static let CLIENT = "ios"
            static let CLIENT_VERSION = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!
            static let HOST = "https://home360-backend-api.et.r.appspot.com/api/v1/"
        }
        
        enum DEV {
            static let CLIENT = "ios"
            static let CLIENT_VERSION = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!
            static let HOST = "https://develop-dot-home360-backend-api.et.r.appspot.com/api/v1/"
        } 
    }
    
    struct SOCIAL_LOGIN {
        
        enum GOOGLE {
            static let CLIENT_ID = "427855209223-vm2c4glt40p36at1pv94ad8m0chtffo6.apps.googleusercontent.com"
        }
        
    }
    
    struct GCM {
        enum GOOGLE {
            static let KEY = "AAAAY54oYwc:APA91bHQOGK_hdZTpp5HmjR_ITErio1PYgiBR4rRlVln9p9iWIcOlaRd18BnKTsUbtF8FnuLiPs63zpWwJJdoV4RT3jDGNcYJA5EwyyC_f5qUCFP0TUz7bFnYMqCgG-7bpdtmA3WItrb"
        }
    }
    
    struct MAP {
        enum GOOGLE {
            static let KEY = "AIzaSyCObXstkurEJQY0xG6mRj6IHkbE1NSS-18"
        }
    }
}


