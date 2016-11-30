//
//  String+Extention.swift
//  WeiBo_Swift3.0
//
//  Created by 李明禄 on 2016/11/29.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import Foundation
import UIKit


func sizeWithText(_ text: NSString, font: UIFont, maxSize: CGSize)->CGSize {
    //定义一个字体
    let attrs: NSDictionary = [font: NSFontAttributeName]
    
    let size = text.boundingRect(with: maxSize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attrs as? [String : AnyObject], context: nil).size
    return size
}
