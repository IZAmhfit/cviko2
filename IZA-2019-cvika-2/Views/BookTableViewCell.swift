//
//  BookTableViewCell.swift
//  IZA-2019-cvika-2
//
//  Created by Martin Hruby on 13/03/2019.
//  Copyright © 2019 Martin Hruby. All rights reserved.
//

import Foundation
import UIKit

//
class BookTableViewCell: UITableViewCell {
    //
    private weak var book: Book?
    
    //
    @IBOutlet var Title: UILabel!
    @IBOutlet var Author: UILabel!
    @IBOutlet var BookCover: UIImageView!
    
    //
    override func prepareForReuse() {
        //
        setBook(nil)
    }
    
    //
    private func clearOutlets() {
        //
        Title.text = "No-title"
        Author.text = "No-one"
        BookCover.image = nil
    }
    
    //
    private func selfConfig() {
        //
        Title.text = book!.title
        Author.text = book!.author
        
        //
        BookCover.image = book!.coverToPresent
    }

    //
    func setBook(_ aBook: Book?) {
        //
        book = aBook
        
        //
        if book == nil { clearOutlets() } else { selfConfig() }
    }
}
