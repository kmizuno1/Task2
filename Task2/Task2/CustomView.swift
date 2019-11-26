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
        setupView()
        
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
    
    func setupView(){
      //パーツの情報を設定
      //各種設定ボタン
      button_setting.setTitle("各種設定", for: .normal)
      button_setting.setTitleColor(.blue, for: .normal)
      button_setting.titleLabel?.font = UIFont.systemFont(ofSize: 16)
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
      //自動ログイン
      labelSwitch._label.text = "自動ログイン"
      labelSwitch._label.font = UIFont.systemFont(ofSize: 16)
      labelSwitch._switch.isOn = false
      //ラベル
      label_loginDate.text = "前回ログイン日時 2019/11/07 12:00:00"
      label_loginDate.font = UIFont.systemFont(ofSize: 16)
      }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //ボタンとラベルのframeをセット
        var x = self.frame.width - safeAreaInsets.right
        let y = safeAreaInsets.top
        //設定ボタン
        x = x  - 10 - button_setting.sizeThatFits(button_setting.frame.size).width
        button_setting.frame = CGRect(x: x, y: y, width: button_setting.sizeThatFits(button_setting.frame.size).width, height: button_setting.sizeThatFits(button_setting.frame.size).height)
        //ログインボタン
        if !button_login.isHidden {
            x = x - 10 - button_login.sizeThatFits(button_login.frame.size).width
            button_login.frame = CGRect(x: x, y: y, width: button_login.sizeThatFits(button_login.frame.size).width, height: button_login.sizeThatFits(button_login.frame.size).height)
        }
        //ログアウトボタン
        if !button_logout.isHidden {
            x = x - 10 - button_logout.sizeThatFits(button_logout.frame.size).width
            button_logout.frame = CGRect(x: x, y: y, width: button_logout.sizeThatFits(button_logout.frame.size).width, height: button_logout.sizeThatFits(button_logout.frame.size).height)
        }
        //スイッチ
        x = x - 10 - labelSwitch.sizeThatFits(labelSwitch.frame.size).width
        labelSwitch.frame = CGRect(x: x, y: y, width: labelSwitch.sizeThatFits(labelSwitch.frame.size).width, height: labelSwitch.sizeThatFits(labelSwitch.frame.size).height)
        //ラベル
        x = x - 20
        label_loginDate.frame = CGRect(x: safeAreaInsets.left + 10, y: y + 6, width: x, height: label_loginDate.sizeThatFits(label_loginDate.frame.size).height)
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
