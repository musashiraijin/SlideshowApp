//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Musashi Raijin on 2016/07/29.
//  Copyright © 2016年 masahiro.kitamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //　進むボタンのAction
    @IBAction func forward(sender: AnyObject) {
    }
    
    // 戻るボタンのAction
    @IBAction func back(sender: AnyObject) {
    }
    
    // 再生・停止ボタンのAction
    @IBAction func playStop(sender: AnyObject) {
    }
    
    // UIImageViweのOutlet
    @IBOutlet weak var image: UIImageView!
    
    // 配列 picture　画像３枚、ライオン、トラ、チーター
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

