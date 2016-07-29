//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Musashi Raijin on 2016/07/29.
//  Copyright © 2016年 masahiro.kitamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func forward(sender: AnyObject) {
    }
    @IBAction func back(sender: AnyObject) {
    }
    @IBAction func playStop(sender: AnyObject) {
    }
    @IBOutlet weak var image: UIImageView!
    
    let picture = ["lion.jpeg", "tiger.jpeg", "cheetah.jpeg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

