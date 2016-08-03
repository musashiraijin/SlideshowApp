//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Musashi Raijin on 2016/07/29.
//  Copyright © 2016年 masahiro.kitamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // 画像の変数nの宣言・初期値0
    var n = 0
    
    // timerが動いているかどうか確認・最初は止まっている false
    var timerRunning = false
    
    // 変数timerの宣言
    var timer : NSTimer!
    
    // 画面遷移時の画像の定数
//    var picture : UIImageView!
    
    var picture = "lion.jpeg"
    
    // 進むボタンのOutlet
    @IBOutlet weak var Forward: UIButton!
    
    // 戻るボタンのOutlet
    @IBOutlet weak var Back: UIButton!
    
    // 遷移先moveImageViewから戻るseque
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
    
    
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
        
        // ImageView がタップされた時の動物の画像
        picture = pictures[n]
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
        
        // ImageView がタップされた時の動物の画像
        picture = pictures[n]   
    }
    
        
    // 再生・停止ボタンのOutlet
    @IBOutlet weak var playStopButton: UIButton!
    
    
    // 再生・停止ボタンのAction
    @IBAction func playStop(sender: AnyObject) {
    
        //timerが止まっているなら.
        if timerRunning == false {
            
            // nを0に初期化する
            n = 0
            
            // ボタンのタイトル変更.
            playStopButton.setTitle("停止", forState: .Normal)
            
            // 進むボタンの無効化
            Forward.enabled = false
            
            // 戻るボタンの無効化
            Back.enabled = false
            
            
            
            //timerを生成する.
            timer = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.slideShow), userInfo: nil, repeats: true)
            
            // スライドショー動作中
            timerRunning = true
            
            
        } else if timerRunning == true {
            // timerが動いていたら
            
            // timerを破棄する.
            timer.invalidate()
            
            // ボタンのタイトル変更.
            playStopButton.setTitle("再生", forState: .Normal)
            
            // 進むボタンの有効化
            Forward.enabled = true
            
            // 戻るボタンの有効化
            Back.enabled = true
            
            //  timerを止める
            timerRunning = false
            
        }
    }
        
        
    // スライドショーで２秒ごとに画像を変えるタイマー

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

    
    
    @IBOutlet weak var imageView: UIImageView!

   
    let pictures = ["lion.jpeg", "tiger.jpeg", "cheetah.jpeg"]
    
    
    var myImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // 変数nを初期値0に設定
        n = 0
        
        imageView.image = UIImage(named: pictures[n])
        
        
        // UIImageViewのタップイベントの検知可能にする
//        imageView.userInteractionEnabled = true
        
        let tapGesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapped(_:)))
        
        tapGesture.delegate = self;
        
        self.view.addGestureRecognizer(tapGesture)
        
        
//        imageView.addGestureRecognizer(tapGestureRecognizer)

    }
    
    
    
    func tapped(sender: UITapGestureRecognizer){
        print(sender)
        //         ShowDetailViewControllerへ遷移するために Segue を呼び出す
        performSegueWithIdentifier("toMoveViewController", sender: nil)
        
    }

    // Segue 準備
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        if (segue.identifier == "toMoveViewController") {
            
            let picture: MoveViewController = (segue.destinationViewController as? MoveViewController)!
            
            
            picture.img = imageView.image
        }
    }
    
    
    
    
/*
    // 画像がタップされた時に反応する処理を書いた関数
    func didClickImageView(recognizer: UIGestureRecognizer) {
        if let varImageView = recognizer.view as? UIImageView {
            let nextViewController = moveImageView
            nextViewController.image = picture
            /** netViewController への遷移 */
        }
    }
*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        
    // 進む・戻るボタンを押すと画像が変化する処理をまとめた関数　nextShow()
    func nextShow(n:Int) {
        
        // 表示する画像を設定する.
        let myImage = UIImage(named: pictures[n])
        
        // 画像をimageViewに設定する.
        imageView.image = myImage
        
        
    }


}

