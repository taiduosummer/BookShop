//
//  ViewController.swift
//  BookShop
//
//  Created by chenpeng on 16/7/1.
//  Copyright © 2016年 summer. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {

    var segmentBook:UISegmentedControl!
    var myTabelView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        segmentBook = UISegmentedControl(items: ["今日推荐","点击排行","新书推荐"])
        segmentBook.selectedSegmentIndex = 0
        view.addSubview(segmentBook)
        segmentBook.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(64)
            make.left.right.equalTo(view)
            make.height.equalTo(30)
        }
    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

