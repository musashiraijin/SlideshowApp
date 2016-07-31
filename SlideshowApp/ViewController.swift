//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Musashi Raijin on 2016/07/29.
//  Copyright © 2016年 masahiro.kitamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 画像の変数nの宣言・初期値0
    var n = 0
    
    // timerが動いているかどうか確認・最初は止まっている false
    var timerRunning = false
    
    // 変数timerの宣言
    var timer : NSTimer!
    
    
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
    
    
    // スライドショーで２秒ごとに画像を変えるタイマー
//    var timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.slideShow), userInfo: nil, repeats: true)
    
    
    
    // 再生・停止ボタンのOutlet
    var playStopButton: UIButton!
    
    
    // 再生・停止ボタンのAction
    @IBAction func playStop(sender: AnyObject) {
        
        //timerが止まっているなら.
        if timerRunning == false {
            
            // nを0に初期化する
            n = 0
            
            //ボタンのタイトル変更.
            playStopButton.setTitle("停止", forState: .Normal)
            
            //timerを生成する.
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: Selector("slideShow:"), userInfo: nil, repeats: true)
            
            // スライドショー動作中
            timerRunning = true
            
            
        } else if timerRunning == true {
            // timerが動いていたら
            
            //timerを破棄する.
            timer.invalidate()
            
            //ボタンのタイトル変更.
            playStopButton.setTitle("再生", forState: .Normal)
            
        }
    }
        
        
// スライドショーで２秒ごとに画像を変えるタイマー
//        var timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.slideShow), userInfo: nil, repeats: true)
    

    
    // スライドショーを実行する関数
    func slideShow(){
        
        // nが0以下ならn=0にする
        if n < 0 {
            n = 0
            
        } else if 0 <= n && n <= 1 {
            // nが0か1なら画像を表示、その後n+1でnを増やす
            
            nextShow(n)
            n = n + 1
            
        } else if n == 2 {
            // nが2なら画像を表示後、nをn=0にする
            
            nextShow(n)
            n = 0
            
        }else if n > 2 {
            
            n = 0
            
        }
        
    }

    
    
    // UIImageViweのOutlet
    @IBOutlet weak var imageView: UIImageView!
    
    
    
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

