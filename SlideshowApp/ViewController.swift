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
        
        
        // 画像が何枚目か判断する分岐
        if n < 0 {
            
            n = 0
        } else if 0 <= n && n < 2  {
            n = n + 1
        } else if n >= 2 {
            n = 0
        }
        
        nextShow(n)
        
    }
    
    
    // 戻るボタンのAction
    @IBAction func back(sender: AnyObject) {
        
        
        // 画像が何枚目か判断する分岐
        if n <= 0 {
            n = 2
        } else if 0 < n && n < 3 {
            n = n - 1
        } else if n >= 3 {
            n = 3
        }
        
        nextShow(n)

    }
    
    // 再生・停止ボタンのAction
    @IBAction func playStop(sender: AnyObject) {
        
        // nの初期化
        n = 0
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector("slideShow"), userInfo: nil, repeats: true);
        
        func slideShow(){
            
            if n < 0 {
                n = 0
                
                nextShow(n)
                
            } else if 0 <= n && n <= 1 {
                
                nextShow(n)
                
                n = n + 1
                
            } else if n == 2 {
                
                nextShow(n)
                
                n = 0
                
            }else if n > 2 {
                
                n = 0
                nextShow(n)
                
            }
            
        }
        
        
        
//        func onUpdate(timer: NSTimer) {

            // 現在の画像表示後、次の画像を表示する準備をする
//            nextShow(n)
//            n = n + 1
            
//        }

        
//        func updateTimer() {
            
//            NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector("onUpdate:"), userInfo: nil, repeats: true)
//        }
        
    }
    
    
    
    
    // UIImageViweのOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    var n = 0
    
    
    // 配列 pictures　画像３枚、ライオン、トラ、チーター
    let pictures = ["lion.jpeg", "tiger.jpeg", "cheetah.jpeg"]
    
    var myImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // 変数nを初期値0に設定
        n = 0
        
        
        // UIImageViewを作成する.
        myImageView = UIImageView(frame: CGRectMake(0,0,350,180))
        
        // 表示する画像を設定する.
        let myImage = UIImage(named: pictures[n])
        
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
    
    
    func nextShow(n:Int) {
        
       // 進む・戻るボタンを押すと画像が変化する処理をまとめた関数　nextShow()
        
        
        // UIImageViewを作成する.
        myImageView = UIImageView(frame: CGRectMake(0,0,350,180))
        
        // 表示する画像を設定する.
        let myImage = UIImage(named: pictures[n])
        
        // 画像をUIImageViewに設定する.
        myImageView.image = myImage
        
        // 画像の表示する座標を指定する.
        myImageView.layer.position = CGPoint(x: self.view.bounds.width/2, y: 180.0)
        
        // UIImageViewをViewに追加する.
        self.view.addSubview(myImageView)
        
    }


}

