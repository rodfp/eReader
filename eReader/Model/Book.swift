//
//  Book.swift
//  eReader
//
//  Created by Rodrigo Franco on 8/11/19.
//

import Foundation

enum Book : String {
  case muchAdoAboutNothing = "Much Ado About Nothing"
  case allWellThatEndsWell = "All's Well That Ends Well"
  case merchantOfVenice = "The Merchant of Venice"
  case hamlet = "Hamlet, Prince of Denmark"
  case macbeth = "Macbeth"
  
  func filePathDirectory() -> String?{
    let filePath = Bundle.main.path(forResource: self.rawValue, ofType: "epub")
    return filePath
  }
  
  static func allValues() -> [Book]{
    return [.muchAdoAboutNothing,.allWellThatEndsWell,.merchantOfVenice,.hamlet,.macbeth]
  }
  
}
