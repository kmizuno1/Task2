//
//  LabelSwitch.swift
//  Task2
//
//  Created by k.mizuno@appdevteam.work on 2019/11/22.
//  Copyright © 2019 k.mizuno@appdevteam.work. All rights reserved.
//

import UIKit

class LabelSwitch: UIView {
    
    let _switch = UISwitch()
    let _label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(_label)
        self.addSubview(_switch)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
       
        let w = self.frame.width
        let h = self.frame.height

        let size = _switch.sizeThatFits( CGSize(width: w, height: h))

         //ラベルとスイッチのframeをセット
        _label.frame = CGRect(x: 0.0, y: 0.0, width: w - size.width, height: h)
        _switch.frame = CGRect(x: w - size.width, y: 0.0, width: size.width, height: h)
    }
        
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let lSize = _label.sizeThatFits(size)
        let sSize = _switch.sizeThatFits(size)
        
        let w = lSize.width + 5 + sSize.width
        let h = max(lSize.height, sSize.height)
        
        return CGSize(width: ceil(w), height: ceil(h))
    }
}
