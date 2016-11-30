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
    
    let screenBounds = UIScreen.main.bounds
    
    let fontTime = UIFont.systemFont(ofSize: 12.0)
    let fontMessage = UIFont.systemFont(ofSize: 10.0)
    
    var cellHeight: CGFloat!
    
    
    let margin: CGFloat = 10
    let iconWidth: CGFloat = 20
    let iconHeight: CGFloat = 25
    
    var message: Message! {
        didSet {
            var timeX: CGFloat = 0
            
            let timeSize = sizeWithText(message.text! as NSString, font: fontTime, maxSize: CGSize(width: screenBounds.width, height: CGFloat(MAXFLOAT)))
            let timeW = screenBounds.width
            let timeH = timeSize.height
             timeX = (screenBounds.width - timeW) / 2
            let timeY = margin
            
            self.timeFrame = CGRect(x: timeX, y: timeY, width: timeW, height: timeH)
            
            let iconWidth = self.iconWidth
            let iconHeight = self.iconHeight
            let iconX = screenBounds.width - margin - iconWidth
            let iconY = self.timeFrame.maxY
            
            self.iconFrame = CGRect(x: iconX, y: iconY, width: iconWidth, height: iconHeight)
            
            let messageSize: CGSize = sizeWithText(message.text! as NSString, font: fontMessage, maxSize: CGSize(width: screenBounds.width - margin - self.iconFrame.maxX, height: CGFloat(MAXFLOAT)))
            
            let messageW = messageSize.width
            let messageH = messageSize.height
            let messageX = screenBounds.width - margin - messageW
            let messageY = self.timeFrame.maxY + margin + CGFloat(3)

            
            self.messageFrame = CGRect(x: messageX, y: messageY, width: messageW, height: messageH)
            
            self.cellHeight = self.messageFrame.maxY + margin

        }
    }
    
    override init() {}

}
