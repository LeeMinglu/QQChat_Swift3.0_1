//
//  LSMessageFrame.swift
//  QQChat_Swift3.0_1
//
//  Created by 李明禄 on 2016/11/30.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSMessageFrame: NSObject {
    
    var timeFrame: CGRect! = nil
    var iconFrame: CGRect! = nil
    var messageFrame: CGRect! = nil
    
    let screenBounds = UIScreen.main.bounds
    
    let fontTime = UIFont.systemFont(ofSize: 8.0)
    let fontMessage = UIFont.systemFont(ofSize: 10.0)
    
    var cellHeight: CGFloat!
    
    
    let margin: CGFloat = 10
    let iconWidth: CGFloat = 20
    let iconHeight: CGFloat = 20
    
    var message: Message! {
        didSet {
            
            let timeSize = sizeWithText(message.text! as NSString, font: fontTime, maxSize: CGSize(width: screenBounds.width, height: CGFloat(MAXFLOAT)))
            let timeW = timeSize.width
            let timeH = timeSize.height
            let timeX = (screenBounds.width - timeW) / 2
            let timeY = margin
            
            self.timeFrame = CGRect(x: timeX, y: timeY, width: timeW, height: timeH)
            
            let iconX = margin
            let iconY = self.timeFrame.maxY
            let iconWidth = self.iconWidth
            let iconHeight = self.iconHeight
            self.iconFrame = CGRect(x: iconX, y: iconY, width: iconWidth, height: iconHeight)
            
            let messageSize: CGSize = sizeWithText(message.text! as NSString, font: fontMessage, maxSize: CGSize(width: screenBounds.width - margin - self.iconFrame.maxX, height: CGFloat(MAXFLOAT)))
            
            let messageX = self.iconFrame.maxX + margin
            let messageY = self.timeFrame.maxY + margin + CGFloat(3)
            let messageW = messageSize.width
            let messageH = messageSize.height
            
            self.messageFrame = CGRect(x: messageX, y: messageY, width: messageW, height: messageH)
            
            self.cellHeight = self.messageFrame.maxY + margin

        }
    }
    
    override init() {}

}
