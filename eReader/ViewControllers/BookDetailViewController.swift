//
//  BookDetailViewController.swift
//  eReader
//
//  Created by Rodrigo Franco on 8/11/19.
//

import Foundation
import UIKit

class BookDetailViewController : UIViewController {
  
  var selectedBook : Book?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationItem.title = self.selectedBook?.rawValue
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    if self.isMovingFromParent {
      guard let book = selectedBook else { return }
      MixpanelHelper.userFinishedReadingBook(book)
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let vc = segue.destination as? eReaderFolioReaderContainer {
      vc.setupBook(self.selectedBook)
    }
  }
  
}
