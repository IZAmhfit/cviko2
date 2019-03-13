//
//  ViewController.swift
//  MyTabDemo
//
//  Created by Martin Hruby on 13/03/2019.
//  Copyright © 2019 Martin Hruby. All rights reserved.
//

import UIKit

class JednickaVC: UIViewController {
    //
}

class DvojkaVC: UIViewController {
    //
}

class ViewController: UIViewController {
    
    //
    lazy var story: UIStoryboard = {
        //
        return UIStoryboard(name: "Main", bundle: nil)
    }()

    //
    lazy var jednickaVC : JednickaVC = {
        //
        return story.instantiateViewController(withIdentifier: "jednicka") as! JednickaVC
    }()
    
    //
    lazy var dvojkaVC : DvojkaVC = {
        //
        return story.instantiateViewController(withIdentifier: "dvojka") as! DvojkaVC
    }()
    
    //
    var current: UIViewController?
    
    //
    func _unmount(vc: UIViewController) {
        //
        guard vc == current else {
            //
            return
        }
        
        //
        vc.willMove(toParent: nil)
        vc.view.removeFromSuperview()
        vc.removeFromParent()
        
        //
        current = nil
    }
    
    //
    func _mount(vc: UIViewController) {
        //
        guard current == nil else {
            //
            return
        }
        //
        vc.willMove(toParent: self)
        self.view.addSubview(vc.view)
        vc.view.frame = self.view.bounds
        vc.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        vc.didMove(toParent: self)
        
        //
        current = vc
    }
    
    //
    func switchto(vc: UIViewController) {
        //
    }
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //
        _mount(vc: jednickaVC)
    }

    //
    @IBAction func jednicka() {
        //
        _unmount(vc: dvojkaVC)
        _mount(vc: jednickaVC)
    }
    
    //
    @IBAction func dvojka() {
        //
        _unmount(vc: jednickaVC)
        _mount(vc: dvojkaVC)
    }
}

