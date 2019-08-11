//
//  MixpanelHelper.swift
//  eReader
//
//  Created by Rodrigo Franco on 8/11/19.
//

import Foundation
import Mixpanel

@objc class MixpanelHelper : NSObject{
  
  @objc class func initAnalytics() {
    Mixpanel.initialize(token: "006e909b2a360947dcb89ff7a82f51d5")
  }
  
  class func userStartedReadingBook(_ book : Book){
    let properties : Properties = ["startTime" : Date(), "book" : book.rawValue]
    trackEvent("userStartedReadingBook", properties: properties)
  }
  
  class func userFinishedReadingBook(_ book : Book){
    let properties : Properties = ["endTime" : Date(), "book" : book.rawValue]
    trackEvent("userFinishedReadingBook", properties: properties)
  }
  
  fileprivate class func trackEvent(_ eventName : String, properties : Properties?){
     Mixpanel.mainInstance().track(event: eventName, properties: properties)
  }
  
}
