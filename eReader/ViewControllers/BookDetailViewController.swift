//
//  BookDetailViewController.swift
//  eReader
//
//  Created by Rodrigo Franco on 8/11/19.
//

import Foundation
import UIKit
import FolioReaderKit

class BookDetailViewController : UIViewController {
  
  var selectedBook : Book?
  @IBOutlet weak var sliderView: UISlider!
  
  private weak var eReaderFolioReaderController : eReaderFolioReaderContainer?
  
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
      vc.changeFontSize(FolioReaderFontSize.m)
      self.eReaderFolioReaderController = vc
    }
  }
  
  @IBAction func sliderValueChanged(_ sender: UISlider) {
    let currentValue = Int(sender.value)
    let xsRange = 0...20
    let sRange = 20...40
    let mRange = 40...60
    let lRange = 60...80
    let xlRange = 80...100
    if xsRange.contains(currentValue){
      self.eReaderFolioReaderController?.changeFontSize(.xs)
    }
    if sRange.contains(currentValue){
      self.eReaderFolioReaderController?.changeFontSize(.s)
    }
    if mRange.contains(currentValue){
      self.eReaderFolioReaderController?.changeFontSize(.m)
    }
    if lRange.contains(currentValue){
      self.eReaderFolioReaderController?.changeFontSize(.l)
    }
    if xlRange.contains(currentValue){
      self.eReaderFolioReaderController?.changeFontSize(.xl)
    }
  }
  
}
