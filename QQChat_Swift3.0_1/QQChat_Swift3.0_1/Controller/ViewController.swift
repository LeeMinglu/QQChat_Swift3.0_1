//
//  ViewController.swift
//  QQChat_Swift3.0_1
//
//  Created by 李明禄 on 2016/11/29.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("&&&&&&" + "\(messages.count)")
        for message in messages {
            print(message)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var messages: [Message] = {
        let path = Bundle.main.path(forResource: "send.plist", ofType: nil)
        
        let messageArray = NSArray(contentsOfFile: path!)
        
        return Message.dict2Model(list: messageArray as! [[String : AnyObject]])
    }()


}

