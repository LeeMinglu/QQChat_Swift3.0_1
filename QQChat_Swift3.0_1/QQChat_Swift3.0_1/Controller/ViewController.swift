//
//  ViewController.swift
//  QQChat_Swift3.0_1
//
//  Created by 李明禄 on 2016/11/29.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    let screenBounds = UIScreen.main.bounds
    
    let identifier = "message"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let frame = CGRect(origin: CGPoint.init(x: 0, y: 0), size: CGSize(width: screenBounds.width, height: screenBounds.height))
        
        let tableView = UITableView.init(frame: screenBounds)
//        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView = tableView
        
        self.tableView.backgroundColor = UIColor.gray
        self.view.addSubview(tableView)
        
        self.tableView.register(LSMessageCell.self, forCellReuseIdentifier: identifier)
        
    }
    
    // MARK: --实现tableView的代理方法--
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messageFrames!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let messageFrame = self.messageFrames?[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! LSMessageCell
        
        cell.cellFrame = messageFrame
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let messageFrame = self.messageFrames![indexPath.row]
        return messageFrame.cellHeight!
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var messageFrames: [LSMessageFrame]! = {
        let path = Bundle.main.path(forResource: "send.plist", ofType: nil)
        
        let messageArray = NSArray(contentsOfFile: path!)
        
        let messages = Message.dict2Model(list: messageArray! as! [[String : AnyObject]])
        
        var messageFramees: [LSMessageFrame]! = []
        for message: Message in messages {
            let messageFrame = LSMessageFrame.init()
            var lastFrame: LSMessageFrame! = nil
            print("=====" + "\(message)")
            if messageFramees!.count != 0  {
                lastFrame = messageFramees!.last!
                if lastFrame.message.time == message.time {
                    messageFrame.isTimeHide = true
                }
            
            }
            
            
//            print("____" +)
            messageFrame.message = message
            messageFramees!.append(messageFrame)
        }
        print("**************")
//        print(messageFrames!.count)
        return messageFramees
    }()
    
    
    
   


}

