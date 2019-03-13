//
//  Book.swift
//  IZA-2019-cvika-2
//
//  Created by Martin Hruby on 13/03/2019.
//  Copyright © 2019 Martin Hruby. All rights reserved.
//

import Foundation
import UIKit

// --------------------------------------------------------------------
// Stav objektu Book. Systemovy stav "new" je urcen pro odliseni
// objektu, ktery jeste nebyl zarazen do databaze.
enum BookState {
    // systemovy stav -> kniha jeste neni v DB
    case new
    // ctenarsky stav
    case reading, finished, burnit
}

// --------------------------------------------------------------------
// Objekt Book je cast Modelu. Je pasivni (negeneruje zadne udalosti)
class Book {
    // ----------------------------------------------------------------
    // Ulozene properties uzivatelske
    var title: String
    var author: String
    let cover: UIImage? = nil
    // Ulozene properties uzivatelske/systemove
    var state: BookState = .new
    
    // !!!
    static let __coverHonzikovaCesta = UIImage(named: "honzikova-cesta.jpg")!
    
    // ----------------------------------------------------------------
    // Vypoctena property: da vzdycky nejaky obrazek
    // (bud ulozeny, nebo Honzikovu cestu)
    var coverToPresent: UIImage {
        //
        guard let _myCover = cover else { return Book.__coverHonzikovaCesta }
        
        //
        return _myCover
    }
    
    // ----------------------------------------------------------------
    // Konstruktory: 1) nova knizka (neni v DB), 2) uz je v db
    // ----------------------------------------------------------------
    init(anewBookCalled title: String,
         by author: String)
    {
        //
        self.state = .new
        self.title = title
        self.author = author
    }
    
    //
    init(existingBookCalled title: String,
         by author: String,
         state: BookState)
    {
        //
        self.state = state
        self.title = title
        self.author = author
    }
}
