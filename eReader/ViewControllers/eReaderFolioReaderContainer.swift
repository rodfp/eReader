//
//  eReaderFolioReaderContainer.swift
//  eReader
//
//  Created by Rodrigo Franco on 8/11/19.
//

import Foundation
import UIKit
import FolioReaderKit

class eReaderFolioReaderContainer: FolioReaderContainer {
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func setupBook(_ book : Book?){
    let config = FolioReaderConfig()
    config.scrollDirection = .horizontalWithVerticalContent
    
    guard let bookPath = book?.filePathDirectory() else { return }
    setupConfig(config, epubPath: bookPath)
  }
  
}
