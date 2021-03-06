//
//  ViewController.swift
//  QQChat_Swift3.0_1
//
//  Created by 李明禄 on 2016/11/29.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit
import UserNotifications


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UNUserNotificationCenterDelegate{
    
    @IBOutlet weak var talkView: UIView!
    
    @IBOutlet weak var input: UITextField!

    
    var tableView: UITableView!
    let screenBounds = UIScreen.main.bounds
    
    var type = 0 ;
    
    let identifier = "message"
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
   //发送消息
        let inputContent = self.input.text!
        //将内容添加到plist文件中
        sendMessage(type: 0, messge: inputContent)
        
        autoAnswer()
        
        print(inputContent)
        return true
    }
    
    func autoAnswer() {
        if self.type == 3 {
            return
        }
        sendMessage(type: 1, messge: "我是机器人回答的")
    }
    
    func sendMessage(type: NSNumber, messge: String) {
        
        if messge.isEmpty {
            self.type = 3
            return
        } else
        {
           self.type = 1
        }
        //初始化模型
        let message: Message = Message.init()
        message.type = type
        message.text = messge
        
        
        let time = Date.init()
        let dateFormat = DateFormatter.init()
        dateFormat.dateFormat = "今天 HH:mm"
        let timeString = dateFormat.string(from: time)
        message.time = timeString
        
        //设置frame模型
        let frameModel = LSMessageFrame.init()
        frameModel.message = message
        
        self.messageFrames.append(frameModel)
        
        self.tableView.reloadData()
        
        let indexPath = IndexPath.init(row: self.messageFrames.count - 1, section: 0)
        
        
        self.tableView.scrollToRow(at: indexPath, at: UITableViewScrollPosition.bottom, animated: true)
        self.input.text = ""
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tableView = UITableView.init(frame: screenBounds)
//        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView = tableView
        
        self.tableView.backgroundColor = UIColor.gray
        self.view.addSubview(tableView)
        
        //注册一个cell
        self.tableView.register(LSMessageCell.self, forCellReuseIdentifier: identifier)
        
        //去掉分隔线
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        //设置tableViewInsets
        let insets = UIEdgeInsetsMake(44, 0, 50, 0)
        self.tableView.contentInset = insets
        
        //添加聊天输入view
        self.view.addSubview(talkView!)
        
        let center = NotificationCenter.default
        
        center.addObserver(self, selector: #selector(self.keyboardWillChangeFrame(note:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        
        
        self.input.delegate = self
        self.input.resignFirstResponder()
        

        //通过添加手势点击空白位置时键盘隐藏
        let tapGuesture = UITapGestureRecognizer.init(target: self, action: #selector(tapView(tap:)))
        
        self.view.addGestureRecognizer(tapGuesture)
  
    }
    
    func tapView(tap: UITapGestureRecognizer) {
        
        self.view.endEditing(true)
    }
    
    func keyboardWillChangeFrame(note: Notification) {
        let keyboardDuration = note.userInfo![UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        let keyboardFrame = note.userInfo![UIKeyboardFrameEndUserInfoKey] as! CGRect
        //取得键盘移动的最终Y值
        let transformY = keyboardFrame.origin.y - self.view.bounds.height
        
                
//        设置View的约束
        self.view.transform = CGAffineTransform.init(translationX: 0, y: transformY)
    }
    
    
    
    
    
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.view.endEditing(true)
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

