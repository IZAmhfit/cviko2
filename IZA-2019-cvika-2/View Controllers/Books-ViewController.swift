//
//  ViewController.swift
//  IZA-2019-cvika-2
//
//  Created by Martin Hruby on 13/03/2019.
//  Copyright © 2019 Martin Hruby. All rights reserved.
//

import UIKit

// --------------------------------------------------------------------
//
class BooksViewController: UITableViewController, BooksDataSourceDelegate {
    // ----------------------------------------------------------------
    // data-sources pro jednotlive sections
    var booksSections: [BooksDataSource] = []
    
    // ----------------------------------------------------------------
    //
    func book(atIndexPath: IndexPath) -> Book {
        //
        return booksSections[atIndexPath.section][atIndexPath.row]
    }
    
    // ----------------------------------------------------------------
    //
    override func viewDidLoad() {
        //
        super.viewDidLoad()
        
        // instacuju jednu sekci. DataSource zahaji zjistovani dat.
        // posila notifikaci
        booksSections.append(BooksDataSource.ALL(delegate: self, section: 0))
    }
    
    // ----------------------------------------------------------------
    // BooksDataSource ->
    func reloadFrom(booksDataSource: BooksDataSource) {
        //
        //tableView.reloadSections(IndexSet(integer: booksDataSource.section),
        //                         with: .automatic)
        tableView.reloadData()
    }
    
    // ----------------------------------------------------------------
    //
    func updateFrom(booksDataSource: BooksDataSource, onBook: Book) {
        //
        tableView.reloadSections(IndexSet(integer: booksDataSource.section),
                                 with: .automatic)
    }
    
    // ----------------------------------------------------------------
    //
    override func numberOfSections(in tableView: UITableView) -> Int {
        //
        return booksSections.count
    }
    
    //
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int
    {
        //
        return booksSections[section].count
    }
    
    //
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String?
    {
        //
        return "Sekce"
    }
    
    // ----------------------------------------------------------------
    //
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! BookTableViewCell
        
        // sebe-konfigurace bunky z dat
        cell.setBook(book(atIndexPath: indexPath))
        
        //
        return cell
    }
    
    // ----------------------------------------------------------------
    //
    override func prepare(for segue: UIStoryboardSegue,
                          sender: Any?)
    {
        //
        if segue.identifier == "bookDetail",
            let _dest = segue.destination as? BookDetailViewController,
            let _selRow = tableView.indexPathForSelectedRow
        {
            //
            _dest.book = book(atIndexPath: _selRow)
        }
        
        //
        if segue.identifier == "addNew",
            let _dest = segue.destination as? BookDetailViewController
        {
            //
            _dest.book = Book(anewBookCalled: "", by: "")
        }
    }
}

