//
//  BookNameCell.swift
//  eReader
//
//  Created by Rodrigo Franco on 8/11/19.
//

import Foundation
import UIKit

class BookNameCell : UITableViewCell {
  
  @IBOutlet weak var bookNameLabel: UILabel!
  
  func setupCell(bookName : String){
    self.bookNameLabel.text = bookName
  }
  
}
