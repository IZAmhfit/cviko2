//
//  AppDelegate.swift
//  IZA-2019-cvika-2
//
//  Created by Martin Hruby on 13/03/2019.
//  Copyright © 2019 Martin Hruby. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    //
    var window: UIWindow?
    
    //
    fileprivate var __booksDB: BooksDB!
    
    //
    var booksDB: BooksDB { return __booksDB }
    
    //
    static var shared : AppDelegate {
        //
        return UIApplication.shared.delegate as! AppDelegate
    }

    //
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        //
        __booksDB = BooksDB()
        
        //
        DispatchQueue.global().async {
            //
            self.__booksDB.gtLoadContent()
        }
        
        //
        return true
    }

}

