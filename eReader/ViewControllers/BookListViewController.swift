//
//  BookListViewController.swift
//  eReader
//
//  Created by Rodrigo Franco on 8/11/19.
//

import Foundation
import UIKit
import FolioReaderKit

class BookListViewController : UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad(){
    super.viewDidLoad()
    self.tableView.delegate = self
    self.tableView.dataSource = self
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let vc = segue.destination as? BookDetailViewController{
      vc.selectedBook = sender as? Book
    }
  }
  
}

extension BookListViewController : UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let books = Book.allValues()
    MixpanelHelper.userStartedReadingBook(books[indexPath.row])
    self.performSegue(withIdentifier: "bookDetail", sender: books[indexPath.row])
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "bookTableViewCell", for: indexPath) as? BookNameCell
      else {
        return UITableViewCell()
    }
    let books = Book.allValues()
    let bookName = books[indexPath.row].rawValue
    cell.setupCell(bookName: bookName)
    return cell
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Book.allValues().count
  }
  
}
