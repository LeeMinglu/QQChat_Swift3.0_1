//
//  LSMessageFrame.swift
//  QQChat_Swift3.0_1
//
//  Created by 李明禄 on 2016/11/30.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSMessageFrame: NSObject {
    
    var timeFrame: CGRect!
    var iconFrame: CGRect!
    var messageFrame: CGRect!
    var isTimeHide: Bool! = false
    
    let screenBounds = UIScreen.main.bounds
    
    let fontTime = UIFont.systemFont(ofSize: 10.0)
    let fontMessage = UIFont.systemFont(ofSize: 12.0)
    
    var cellHeight: CGFloat!
    
    
    let margin: CGFloat = 10
    let iconWidth: CGFloat = 30
    let iconHeight: CGFloat = 30
    
    var message: Message! {
        didSet {
            
            var timeX: CGFloat = 0
            
            let timeSize = sizeWithText(message.text! as NSString, font: fontTime, maxSize: CGSize(width: screenBounds.width, height: CGFloat(MAXFLOAT)))
            let timeW = screenBounds.width
            let timeH = timeSize.height
            timeX = (screenBounds.width - timeW) / 2
            let timeY = margin
            if !isTimeHide {
                self.timeFrame = CGRect(x: timeX, y: timeY, width: timeW, height: timeH)
            }else {
                self.timeFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
            }
            
            let iconWidth = self.iconWidth
            let iconHeight = self.iconHeight
            var iconX = screenBounds.width - margin - iconWidth
            let iconY = self.timeFrame.maxY
            if message.type == 1 {
                iconX = margin
            }
            
            self.iconFrame = CGRect(x: iconX, y: iconY, width: iconWidth, height: iconHeight)
            
            let messageSize: CGSize = sizeWithText(message.text! as NSString, font: fontMessage, maxSize: CGSize(width: CGFloat(180), height: CGFloat(MAXFLOAT)))
            
            let messageW = messageSize.width + 40
            let messageH = messageSize.height + 30
            var messageX: CFloat!
            if message.type == 1 {
                messageX = CFloat(margin * 2 + self.iconWidth)
            } else {
                messageX = CFloat(screenBounds.width - messageW - margin - iconWidth - margin)
            }
            let messageY = self.timeFrame.maxY + margin
            
           
            
            
            self.messageFrame = CGRect(x: CGFloat(messageX!), y: messageY, width: messageW, height: messageH)
            
            self.cellHeight = self.messageFrame.maxY + margin

        }
    }
    
    override init() {}

}
