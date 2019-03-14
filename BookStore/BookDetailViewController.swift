//
//  BookDetailViewController.swift
//  BookStore
//
//  Created by Martin Hruby on 14/03/2019.
//  Copyright © 2019 Martin Hruby. All rights reserved.
//

import Foundation
import UIKit

//
protocol BookDetailVCDelegate : AnyObject {
    //
    func newBookDefined(aBook: Book)
}

//
class BookDetailViewController: UITableViewController
{
    //
    @IBOutlet var Cover: UIImageView!
    @IBOutlet var BookTitle: UITextField!
    @IBOutlet var Author: UITextField!
    
    //
    var book: Book!
    weak var delegate: BookDetailVCDelegate?
    
    //
    func saveToModel() {
        //
        if let _title = BookTitle.text,
            let _author = Author.text
        {
            //
            book.author = _author
            book.title = _title
        }
    }
    
    //
    @objc func saveFunc() {
        //
        saveToModel()
        
        //
        if book.indb == false {
            //
            DispatchQueue.main.async {
                //
                self.delegate?.newBookDefined(aBook: self.book)
            }
        }
        
        //
        navigationController?.popViewController(animated: true)
    }
    
    //
    override func viewDidLoad() {
        //
        super.viewDidLoad()
        
        //
        Cover.image = book.coverToPresent
        BookTitle.text = book.title
        Author.text = book.author
        
        //
        let _back = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(BookDetailViewController.saveFunc))
        
        //
        navigationItem.leftBarButtonItem = _back
    }
    
}
