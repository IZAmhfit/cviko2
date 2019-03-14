//
//  Book.swift
//  BookStore
//
//  Created by Martin Hruby on 14/03/2019.
//  Copyright © 2019 Martin Hruby. All rights reserved.
//

import Foundation
import UIKit

//
class Book {
    //
    var title: String
    var author: String
    
    //
    var cover: UIImage? = nil
    var indb = true
    
    //
    static let __hcesta = UIImage(named: "HCesta.jpg")!
    
    //
    var coverToPresent: UIImage {
        //
        guard let _cover = cover else {
            return Book.__hcesta }
        
        //
        return _cover
    }
    
    //
    init(title: String, author: String) {
        //
        self.title = title
        self.author = author
    }
}
