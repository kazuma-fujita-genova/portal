//
//  NotifyListViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

class NotifyListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var notifyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        notifyTableView.delegate = self
        notifyTableView.dataSource = self
        
        // テーブルのタップを無効
        notifyTableView.allowsSelection = false
        
        // TableViewCellをTableViewに登録
        let nib = UINib(nibName: "NotifyListTableViewCell", bundle: nil)
        notifyTableView.register(nib, forCellReuseIdentifier: "Cell")
        
        // TableViewCellの高さをAutoLayoutで自動調整
        notifyTableView.rowHeight = UITableView.automaticDimension
        // TableViewCellの高さ概算を設定
        notifyTableView.estimatedRowHeight = 120
        
        self.title = "お知らせ"
        // iOS 11 からの機能
        if #available(iOS 11.0, *) {
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = notifyTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NotifyListTableViewCell
        return cell
    }
    
    

}
