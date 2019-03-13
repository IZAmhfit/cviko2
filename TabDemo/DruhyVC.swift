//
//  DruhyVC.swift
//  TabDemo
//
//  Created by Martin Hruby on 13/03/2019.
//  Copyright © 2019 Martin Hruby. All rights reserved.
//

import Foundation
import UIKit

//
class DruhyVC : UITableViewController {
    //
    var data: [String] = ["prvni", "druhy", "treti"]
    
    //
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1;
    }
    
    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //
        return data.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        //
        cell.textLabel?.text = data[indexPath.row]
        
        //
        return cell
    }
}
