//
//  FavoriteViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/11/19.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self

        // テーブルセルのタップを無効にする
        favoriteTableView.allowsSelection = false
        let nib = UINib(nibName: "FavoriteTableViewCell", bundle: nil)
        favoriteTableView.register(nib, forCellReuseIdentifier: "Cell")
        
        // テーブル行の高さの概算値を設定
        favoriteTableView.estimatedRowHeight = 755
        // テーブル行の高さをAutoLayoutで自動調整する
        favoriteTableView.rowHeight = UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FavoriteTableViewCell
        // cell.contentView.backgroundColor = UIColor.lightGray
        cell.institutionImageView.hero.id = "institutionImageView"
        cell.institutionNameLabel.hero.id = "institutionNameLabel"
        return cell
    }
}
