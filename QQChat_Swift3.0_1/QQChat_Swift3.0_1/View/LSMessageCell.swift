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
    
    var cellFrame: LSMessageFrame! {
        didSet {
            let message = cellFrame.message!
            
            //设置Frame
            self.timeLabel.frame = cellFrame.timeFrame
            self.iconView.frame = cellFrame.iconFrame
            
//            let messageBackground = UIImage(named: String)
            
            self.messageView.frame = cellFrame.messageFrame
            
            //设置数据
            self.timeLabel.text = message.time!
            
            self.messageView.titleLabel!.text = message.text
            
            
            if message.type == 0 {
                self.iconView.image = UIImage.init(named: "me")
            }else {
                self.iconView.image = UIImage.init(named: "other")            }
            
            
        
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
            self.messageView.sizeToFit()
            self.messageView.titleLabel!.adjustsFontSizeToFitWidth = true
            self.messageView.titleLabel!.numberOfLines = 0
//            self.messageView.backgroundColor = UIColor.blue
            self.contentView.addSubview(self.messageView)
        
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
