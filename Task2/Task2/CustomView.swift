//
//  LeftView.swift
//  Task2
//
//  Created by k.mizuno@appdevteam.work on 2019/11/20.
//  Copyright © 2019 k.mizuno@appdevteam.work. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    let label_loginDate = UILabel()
    let button_login = UIButton()
    let button_logout = UIButton()
    let button_setting = UIButton()
    let labelSwitch = LabelSwitch()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //パーツの情報を設定
        //ラベル1
        label_loginDate.text = "前回ログイン日時 2019/11/07 12:00:00"
        label_loginDate.font = UIFont.systemFont(ofSize: 16)
        //ボタン1
        button_login.setTitle("ログイン", for: .normal)
        button_login.setTitleColor(.blue, for: .normal)
        button_login.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button_login.isHidden = false
        button_login.addTarget(self, action: #selector(loginButtonEvent(_:)), for: .touchUpInside)
        //ボタン2
        button_logout.setTitle("ログアウト", for: .normal)
        button_logout.setTitleColor(.blue, for: .normal)
        button_logout.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button_logout.isHidden = true
        button_logout.addTarget(self, action: #selector(logoutButtonEvent(_:)), for: .touchUpInside)
        //ボタン3
        button_setting.setTitle("各種設定", for: .normal)
        button_setting.setTitleColor(.blue, for: .normal)
        button_setting.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        //スイッチ1
        labelSwitch._label.text = "自動ログイン"
        labelSwitch._label.font = UIFont.systemFont(ofSize: 16)
        labelSwitch._switch.isOn = false
        
        //パーツを追加
        addSubview(label_loginDate)
        addSubview(button_login)
        addSubview(button_logout)
        addSubview(button_setting)
        addSubview(labelSwitch)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let labelSize = label_loginDate.sizeThatFits(label_loginDate.frame.size)
        let loginSize = button_login.sizeThatFits(button_login.frame.size)
        let logoutSize = button_logout.sizeThatFits(button_logout.frame.size)
        let settingSize = button_setting.sizeThatFits(button_setting.frame.size)
        let labelSwitchSize = labelSwitch.sizeThatFits(labelSwitch.frame.size)
        var x = self.frame.width - safeAreaInsets.right - 10 - settingSize.width
        let y = safeAreaInsets.top
        var n: CGFloat
        
        //ボタンとラベルのframeをセット
        button_setting.frame = CGRect(x: x, y: y, width: settingSize.width, height: settingSize.height)
        if button_login.isHidden {
            n = logoutSize.width
        }else{
            n = loginSize.width
        }
        x = x - 10 - n
        button_logout.frame = CGRect(x: x, y: y, width: logoutSize.width, height: logoutSize.height)
        button_login.frame = CGRect(x: x, y: y, width: loginSize.width, height: loginSize.height)
        x = x - 10 - labelSwitchSize.width
        labelSwitch.frame = CGRect(x: x, y: y, width: labelSwitchSize.width, height: labelSwitchSize.height)
        x = x - 20
        label_loginDate.frame = CGRect(x: 10 + safeAreaInsets.left, y: y + 6, width: x, height: labelSize.height)
    }
    
    //ログインボタンタップイベント
    @objc func loginButtonEvent(_ sender: UIButton){
        button_login.isHidden = true
        button_logout.isHidden = false
        setNeedsLayout()
    }
    //ログアウトボタンタップイベント
    @objc func logoutButtonEvent(_ sender: UIButton){
        button_login.isHidden = false
        button_logout.isHidden = true
        setNeedsLayout()
    }
}
