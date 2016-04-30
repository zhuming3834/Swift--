//
//  ViewController.swift
//  Swift-通知
//
//  Created by hgdq on 16/4/24.
//  Copyright © 2016年 hgdq. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var revLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        // 注册通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.getNotice), name: "Swift-通知", object: nil)
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        // 销毁通知
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "Swift-通知", object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    /**
     同一个页面发送通知
     - parameter sender: sender description
     */
    @IBAction func postBtnClick(sender: UIButton) {
        NSNotificationCenter.defaultCenter().postNotificationName("Swift-通知", object: "Swift-通知")
    }
    /**
     实现通知方法
     - parameter notice: 通知
     */
    func getNotice(notice: NSNotification){
        let getStr = notice.object as! String
        self.revLabel.text = getStr as String;
    }
    /**
     跨页面发送通知
     - parameter sender: sender description
     */
    @IBAction func postBtnClick2(sender: UIButton) {
        self.presentViewController(SecondViewController(), animated: true, completion: nil)
        NSNotificationCenter.defaultCenter().postNotificationName("跨页面通知", object: "跨页面通知")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

