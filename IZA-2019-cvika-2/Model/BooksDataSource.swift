//
//  BooksDataSource.swift
//  IZA-2019-cvika-2
//
//  Created by Martin Hruby on 13/03/2019.
//  Copyright © 2019 Martin Hruby. All rights reserved.
//

//
import Foundation
import UIKit

// --------------------------------------------------------------------
//
typealias BooksFilter = (Book) -> Bool

// --------------------------------------------------------------------
//
protocol BooksDataSourceDelegate : AnyObject {
    //
    func reloadFrom(booksDataSource: BooksDataSource)
    func updateFrom(booksDataSource: BooksDataSource, onBook: Book)
}

// --------------------------------------------------------------------
//
class BooksDataSource {
    // ----------------------------------------------------------------
    //
    var selection: [Book] = []
    let filter: BooksFilter
    let section: Int
    
    // ----------------------------------------------------------------
    //
    weak var delegate: BooksDataSourceDelegate?
    
    // ----------------------------------------------------------------
    //
    var count: Int { return selection.count }
    var db: BooksDB { return AppDelegate.shared.booksDB }
    
    // ----------------------------------------------------------------
    //
    subscript(_ idx: Int) -> Book { return selection[idx] }
    
    // ----------------------------------------------------------------
    //
    init(section: Int, delegate: BooksDataSourceDelegate,
         filter: @escaping BooksFilter)
    {
        //
        self.filter = filter
        self.delegate = delegate
        self.section = section
    }
    
    //
    deinit {
        //
        NotificationCenter.default.removeObserver(self)
    }
    
    // ----------------------------------------------------------------
    //
    private func loadFromDB() {
        //
        selection = db.items.filter(self.filter)
        
        //
        DispatchQueue.main.async {
            //
            self.delegate?.reloadFrom(booksDataSource: self)
        }
    }
    
    // ----------------------------------------------------------------
    //
    @objc func ncMessageObserver(_ notif: Notification) {
        //
        if let _aBook = notif.object as? Book {
            //
            if selection.contains(where: { $0 === _aBook }) {
                //
                DispatchQueue.main.async {
                    //
                    self.delegate?.updateFrom(booksDataSource: self,
                                              onBook: _aBook)
                }
            }
        } else {
            //
            loadFromDB()
        }
    }
    
    //
    func startup() {
        //
        let nc = NotificationCenter.default
        
        //
        nc.addObserver(self,
                       selector: #selector(BooksDataSource.ncMessageObserver(_:)),
                       name: BooksDB.ncMessage,
                       object: nil)
        
        //
        loadFromDB()
    }
}


// --------------------------------------------------------------------
//
extension BooksDataSource {
    //
    static func ALL(delegate: BooksDataSourceDelegate,
                    section: Int) -> BooksDataSource
    {
        //
        let bds = BooksDataSource(section: section, delegate: delegate,
                                  filter: { _ in true })
        
        //
        bds.startup()
        
        //
        return bds
    }
}
