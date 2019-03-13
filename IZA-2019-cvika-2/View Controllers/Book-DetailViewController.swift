//
//  Book-DetailViewController.swift
//  IZA-2019-cvika-2
//
//  Created by Martin Hruby on 13/03/2019.
//  Copyright © 2019 Martin Hruby. All rights reserved.
//

//
import Foundation
import UIKit

// --------------------------------------------------------------------
// Detailni pohled na Book
class BookDetailViewController: UITableViewController {
    // vzdy !!! musi mit nejaky platny objekt
    var book: Book!
    
    //
    @IBOutlet var BookCover: UIImageView!
    @IBOutlet var Author: UITextField!
    @IBOutlet var BookTitle: UITextField!

    // ----------------------------------------------------------------
    // aktualizuje obsah objektu a notifikuje DB o zmene objektu
    func updateModel() {
        //
        if let _author = Author.text, let _title = BookTitle.text {
            //
            book.author = _author
            book.title = _title
            
            //
            AppDelegate.shared.booksDB.updated(aBook: book)
        }
    }
    
    // ----------------------------------------------------------------
    // leve "back" tlacitko
    @objc func goingBack(_ sender: Any) {
        // TODO: detekovat, zda-li doslo ke zmene hodnoty, at se
        // zbytecne nerozesilaji notifikace
        updateModel()
        
        // navrat ve stacku
        self.navigationController?.popViewController(animated: true)
    }
    
    // ----------------------------------------------------------------
    //
    override func viewDidLoad() {
        //
        super.viewDidLoad()
        
        //
        BookCover.image = book.coverToPresent
        BookTitle.text = book.title
        Author.text = book.author
        
        //
        let _back = UIBarButtonItem(barButtonSystemItem: .save,
                                    target: self,
                                    action: #selector(BookDetailViewController.goingBack(_:)))
        
        //
        navigationItem.leftBarButtonItem = _back
    }
}
