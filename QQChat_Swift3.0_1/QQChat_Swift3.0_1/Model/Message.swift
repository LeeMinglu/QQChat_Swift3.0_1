//
//  Send.swift
//  QQChat_Swift3.0_1
//
//  Created by 李明禄 on 2016/11/29.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

//定义
enum LSMessageType {
    case LSMessageSelf,LSMessageOther
}

class Message: NSObject {
    var text: String?
    var time: String?
    var type: NSNumber?
    
    let properties = ["text", "time", "type"]
    override var description: String {
        let dict = dictionaryWithValues(forKeys: properties)
        return ("\(dict)")
    }
    // MARK: - 构造函数
    override init() {
        
    }
    init(dict: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func  setValue(_ value: Any?, forUndefinedKey key: String) { }
    
    class func dict2Model(list: [[String: AnyObject]]) -> [Message] {
        
        var models = [Message]()
        for dict in list {
            models.append(Message(dict: dict))
        }
        return models
    }
}
