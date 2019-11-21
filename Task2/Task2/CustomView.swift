//
//  LeftView.swift
//  Task2
//
//  Created by k.mizuno@appdevteam.work on 2019/11/20.
//  Copyright © 2019 k.mizuno@appdevteam.work. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    let label_loginDate: UILabel = UILabel()
    let button_login: UIButton = UIButton()
    let button_logout: UIButton = UIButton()
    let button_setting: UIButton = UIButton()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //パーツの情報を設定
        //ラベル
        label_loginDate.text = "前回ログイン日時 2019/11/07 12:00:00"
        label_loginDate.font = UIFont.systemFont(ofSize: 16)
        //ログインボタン
        button_login.setTitle("ログイン", for: .normal)
        button_login.setTitleColor(.blue, for: .normal)
        button_login.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button_login.isHidden = false
        button_login.addTarget(self, action: #selector(loginButtonEvent(_:)), for: .touchUpInside)
        //ログアウトボタン
        button_logout.setTitle("ログアウト", for: .normal)
        button_logout.setTitleColor(.blue, for: .normal)
        button_logout.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button_logout.isHidden = true
        button_logout.addTarget(self, action: #selector(logoutButtonEvent(_:)), for: .touchUpInside)
        //各種設定ボタン
        button_setting.setTitle("各種設定", for: .normal)
        button_setting.setTitleColor(.blue, for: .normal)
        button_setting.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        
        //パーツを追加
        addSubview(label_loginDate)
        addSubview(button_login)
        addSubview(button_logout)
        addSubview(button_setting)
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
        var x = self.frame.width - safeAreaInsets.right - 10 - settingSize.width
        let y = safeAreaInsets.top
        
        //ボタンとラベルのframeをセット
        button_setting.frame = CGRect(x: x, y: y, width: settingSize.width, height: settingSize.height)
        x = x - 10 - logoutSize.width
        button_logout.frame = CGRect(x: x, y: y, width: logoutSize.width, height: logoutSize.height)
        x = x - 10 - loginSize.width
        button_login.frame = CGRect(x: x, y: y, width: loginSize.width, height: loginSize.height)
        x = x - 20
        label_loginDate.frame = CGRect(x: 10 + safeAreaInsets.left, y: y + 6, width: x, height: labelSize.height)
    }
    
    //ログインボタンタップイベント
    @objc func loginButtonEvent(_ sender: UIButton){
        button_login.isHidden = true
        button_logout.isHidden = false
    }
    //ログアウトボタンタップイベント
    @objc func logoutButtonEvent(_ sender: UIButton){
        button_login.isHidden = false
        button_logout.isHidden = true
    }
}
