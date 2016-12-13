//
//  LSMessageCell.swift
//  QQChat_Swift3.0_1
//
//  Created by 李明禄 on 2016/11/30.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSMessageCell: UITableViewCell {
    var timeLabel: UILabel!
    var iconView: UIImageView!
    var messageView: UIButton!
    let fontTime = UIFont.systemFont(ofSize: 10.0)
    let fontMessage = UIFont.systemFont(ofSize: 12.0)
    
    var nor: String!
    var high: String!
    
    var cellFrame: LSMessageFrame! {
        didSet {
            let message = cellFrame.message!
            
            //设置Frame
            self.timeLabel.frame = cellFrame.timeFrame
            self.iconView.frame = cellFrame.iconFrame
            
//            let messageBackground = UIImage(named: String)
            
            
            //设置数据
            self.timeLabel.text = message.time!
            
            
            
            if message.type == 0 {
                self.iconView.image = UIImage.init(named: "me")
                nor = "chat_send_nor"
                high = "chat_send_press_pic"
                
                self.messageView.setBackgroundImage(UIImage(named: nor), for: UIControlState.normal)
                self.messageView.setBackgroundImage(UIImage(named: high), for: UIControlState.highlighted)
                self.messageView.setTitleColor(UIColor.white, for: UIControlState.normal)
            }else {
                nor = "chat_recive_nor"
                high = "chat_recive_press_pic"

                self.iconView.image = UIImage.init(named: "other")
                self.messageView.setBackgroundImage(UIImage(named: nor), for: UIControlState.normal)
                self.messageView.setBackgroundImage(UIImage(named: high), for: UIControlState.highlighted)
                self.messageView.setTitleColor(UIColor.black, for: UIControlState.normal)
                
            }
            
            let imageNormal = UIImage(named: nor)
            let imageHighlighted = UIImage(named: high)
//            imageNormal!.stretchableImage(withLeftCapWidth: Int(imageNormal!.size.width * 0.4), topCapHeight: Int(imageNormal!.size.width * 0.4))
            
            
            self.messageView.contentEdgeInsets = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
            
            let insets = UIEdgeInsets(top: 40, left: 30, bottom: 40, right: 30)
            
//            imageNormal!.resizableImage(withCapInsets: insets, resizingMode: UIImageResizingMode.stretch)

            self.messageView.setTitle(message.text, for: UIControlState.normal)
            
            self.messageView.frame = cellFrame.messageFrame


        }
    
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        if !self.isEqual(nil) {
            
            let timeLabel = UILabel.init()
                        self.timeLabel = timeLabel
//            self.timeLabel.sizeToFit()
            
            self.timeLabel.textAlignment = NSTextAlignment.center
            self.timeLabel.font = fontTime

            self.timeLabel.adjustsFontSizeToFitWidth = true
            self.contentView.addSubview(self.timeLabel)
            
            
            let iconView = UIImageView.init()
            self.iconView = iconView
            self.contentView.addSubview(self.iconView)
            
            let messageView = UIButton.init()
            self.messageView = messageView
            self.messageView.titleLabel!.font = fontMessage
//            self.messageView.sizeToFit()
            self.messageView.titleLabel!.sizeToFit()
//            self.messageView.setTitleColor(UIColor.black, for: UIControlState.normal)

            
            self.messageView.titleLabel!.adjustsFontSizeToFitWidth = true
            self.messageView.titleLabel!.numberOfLines = 0

            self.contentView.addSubview(self.messageView)
        
        }
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
