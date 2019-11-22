//
//  ViewController.swift
//  Task2
//
//  Created by k.mizuno@appdevteam.work on 2019/11/20.
//  Copyright © 2019 k.mizuno@appdevteam.work. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let customView: CustomView! = CustomView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //customViewを追加
        view.addSubview(customView)
    }
    
    override func viewWillLayoutSubviews() {
        //customViewのframeをセット
        customView.frame = CGRect(x: view.safeAreaInsets.left, y: view.safeAreaInsets.top, width: view.frame.size.width - (view.safeAreaInsets.left + view.safeAreaInsets.right), height: view.frame.size.height - (view.safeAreaInsets.top + view.safeAreaInsets.bottom))
    }
    
    
}
