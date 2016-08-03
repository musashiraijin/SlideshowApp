//
//  MoveViewController.swift
//  SlideshowApp
//
//  Created by Musashi Raijin on 2016/08/03.
//  Copyright © 2016年 masahiro.kitamura. All rights reserved.
//

import UIKit

class MoveViewController: UIViewController {
    
    // UIImageViewのOutlet
    @IBOutlet weak var moveImageView: UIImageView!
    
    
    // 表示する画像pictureの初期化
    var picture = "lion.jpeg"
    
    var img:UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        // 表示する画像を設定する.
        let myImage = UIImage(named: picture)
        
        // 画像をUIImageViewに設定する.
        moveImageView.image = myImage

    
    
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
