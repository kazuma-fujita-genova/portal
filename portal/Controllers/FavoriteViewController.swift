//
//  FavoriteViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//
import UIKit

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        
        let nib = UINib(nibName: "FavoriteTableViewCell", bundle: nil)
        favoriteTableView.register(nib, forCellReuseIdentifier: "Cell")
        
        // テーブルセルのタップを無効にする
        favoriteTableView.allowsSelection = false
        // テーブル行の高さをAutoLayoutで自動調整する
        favoriteTableView.rowHeight = UITableView.automaticDimension
        // テーブル行の高さの概算値を設定しておく
        // 高さ概算値 = 「縦横比1:1のUIImageViewの高さ(=画面幅)」+「いいねボタン、キャプションラベル、その他余白の高さの合計概算(=100pt)」
        // favoriteTableView.estimatedRowHeight = UIScreen.main.bounds.width + 100
    }
    
    override public var traitCollection: UITraitCollection {
        if UIDevice.current.userInterfaceIdiom == .pad && UIDevice.current.orientation.isPortrait {
            return UITraitCollection(traitsFrom:[UITraitCollection(horizontalSizeClass: .compact),
                                                 UITraitCollection(verticalSizeClass: .regular)])
        }
        return super.traitCollection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FavoriteTableViewCell
        cell.name.text = "マテリアル医院"
        //cell.
        return cell
    }
    
}
