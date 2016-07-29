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
    @IBOutlet weak var imageView: UIImageView!
    
    
    // 配列 pictures　画像３枚、ライオン、トラ、チーター
    let pictures = ["lion.jpeg", "tiger.jpeg", "cheetah.jpeg"]
    
    var myImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // UIImageViewを作成する.
        myImageView = UIImageView(frame: CGRectMake(0,0,350,180))
        
        // 表示する画像を設定する.
        let myImage = UIImage(named: pictures[0])
        
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        
        // 画像の表示する座標を指定する.
        myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 180.0)
        
        // UIImageViewをViewに追加する.
        self.view.addSubview(myImageView)
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

