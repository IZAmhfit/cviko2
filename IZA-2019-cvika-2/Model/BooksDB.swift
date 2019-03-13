//
//  BooksDB.swift
//  IZA-2019-cvika-2
//
//  Created by Martin Hruby on 13/03/2019.
//  Copyright © 2019 Martin Hruby. All rights reserved.
//

import Foundation

// --------------------------------------------------------------------
// V aplikaci existuje jeden singleton BooksDB (AppDelegate::booksDB)
// --------------------------------------------------------------------
// Objekt drzi original vsech objektu Book
// Sem smeruje editace obsahu databaze: add/remove/edit
class BooksDB {
    // ----------------------------------------------------------------
    // original vsech evidovanych objektu. Slo by nejak zapouzdrit...
    var items: [Book] = []
    
    // tuto zpravu bude BooksDB rozesilat pres Notifikacni centrum
    // BooksDB nema explicitne registrovane observery
    static let ncMessage = Notification.Name("BooksDB:ping:toall")
    
    // ----------------------------------------------------------------
    // ping v MT
    private func pingObservers(with aBook: Book? = nil) {
        // Notifikace laskave posilejme vyhradne v MT
        DispatchQueue.main.async {
            // zprava: nazev + Optional<aBook>
            let nn = Notification(name: BooksDB.ncMessage,
                                  object: aBook, userInfo: nil)
            
            //
            NotificationCenter.default.post(nn)
        }
    }
    
    // ----------------------------------------------------------------
    // Simulace nacteni DB z nejakeho zdroje (sitovy dotaz na SQL..)
    // Smi pracovat v Global-queue (gt*)
    func gtLoadContent() {
        //
        let _data = [Book(existingBookCalled: "Honzikova cesta",
                          by: "B. Riha",
                          state: .reading),
                    Book(existingBookCalled: "Tri musketyru",
                         by: "A. Dumas",
                         state: .reading)]
        
        //
        DispatchQueue.main.async {
            //
            self.items = _data
            
            //
            self.pingObservers()
        }
    }
}

// --------------------------------------------------------------------
//
extension BooksDB {
    //
    func updated(aBook: Book) {
        //
        switch aBook.state {
        case .new:
            //
            aBook.state = .reading
            items.append(aBook);
            
            //
            pingObservers();
            
        default:
            pingObservers(with: aBook)
        }
    }
}
