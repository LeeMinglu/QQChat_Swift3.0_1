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
        for messf in messageFrames {
            print(messf.message.text!)
        }
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var messageFrames: [LSMessageFrame]! = {
        let path = Bundle.main.path(forResource: "send.plist", ofType: nil)
        
        let messageArray = NSArray(contentsOfFile: path!)
        
        let messages: [Message]! = Message.dict2Model(list: messageArray! as! [[String : AnyObject]])
        
        var messageFrames: [LSMessageFrame]! = []
        for message in messages {
            let messageFrame = LSMessageFrame.init()
            messageFrame.message = message
            messageFrames.append(messageFrame)
        }
        print("**************")
        print(messageFrames.count)
        return messageFrames
    }()
    
    
    
   


}

