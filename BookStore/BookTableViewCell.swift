//
//  BookTableViewCell.swift
//  BookStore
//
//  Created by Martin Hruby on 14/03/2019.
//  Copyright © 2019 Martin Hruby. All rights reserved.
//

import Foundation
import UIKit

//
class BookTableViewCell: UITableViewCell {
    //
    @IBOutlet var title: UILabel?
    @IBOutlet var author: UILabel?
    @IBOutlet var cover: UIImageView?
    
    //
    func selfConfig(book: Book) {
        //
        title?.text = book.title
        author?.text = book.author
        cover?.image = book.coverToPresent
    }
}
