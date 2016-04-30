//
//  SecondViewController.swift
//  Swift-通知
//
//  Created by hgdq on 16/4/24.
//  Copyright © 2016年 hgdq. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var showLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 注册通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(SecondViewController.getNotice2), name: "跨页面通知", object: nil)
        // 延时3秒后 返回上一个页面
        self.performSelector(#selector(SecondViewController.goBack), withObject: nil, afterDelay: 3)
        // Do any additional setup after loading the view.
    }
    /**
     实现通知方法
     - parameter notice: 通知
     */
    func getNotice2(notice: NSNotification){
        let getStr = notice.object as! String
        self.showLabel.text = getStr as String
    }
    
    func goBack(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    /**
     移除通知
     */
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "跨页面通知", object: nil)
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
