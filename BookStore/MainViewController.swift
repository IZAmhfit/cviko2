//
//  ViewController.swift
//  BookStore
//
//  Created by Martin Hruby on 14/03/2019.
//  Copyright © 2019 Martin Hruby. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController, BookDetailVCDelegate
{
    //
    func newBookDefined(aBook: Book) {
        //
        aBook.indb = true
        books.append(aBook)
        
        //
        tableView.reloadData()
    }
    
    //
    var books: [Book] = []

    //
    override func viewDidLoad() {
        //
        super.viewDidLoad()
        
        //
        books.append(Book(title: "Honzikova cesta", author: "B. Riha"))
        books.append(Book(title: "Tri musketyri", author: "A. Dumas"))
        
        //
    }

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        //
        return books.count
    }
    
    //
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //
        let _book = books[indexPath.row]
        let _cell = tableView.dequeueReusableCell(withIdentifier: "bookCell") as! BookTableViewCell
        
        //
        _cell.selfConfig(book: _book)
        
        //
        return _cell
    }
    
    //
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        //
        if segue.identifier == "seeBookDetail",
            let _dvc = segue.destination as? BookDetailViewController,
            let _ip = tableView.indexPathForSelectedRow
        {
            //
            _dvc.book = books[_ip.row]
        }
        
        //
        if segue.identifier == "newBook",
            let _dvc = segue.destination as? BookDetailViewController
        {
            //
            _dvc.book = Book(title: "...",
                             author: "...")
            
            //
            _dvc.book.indb = false
            _dvc.delegate = self
        }
    }
}

