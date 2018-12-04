//
//  FavoriteViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/11/21.
//  Copyright © 2018 藤田和磨. All rights reserved.
//


import UIKit
import AMScrollingNavbar

class FavoriteViewController: UITableViewController {
    
    //@IBOutlet weak var favoriteTableView: UITableView!
    @IBOutlet var favoriteTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        
        // CellをTableViewに設定
        let nib = UINib(nibName: "FavoriteTableViewCell", bundle: nil)
        favoriteTableView.register(nib, forCellReuseIdentifier: "Cell")
        // テーブルセルのタップを無効
        favoriteTableView.allowsSelection = false
        // テーブル行の高さの概算値を設定
        // favoriteTableView.estimatedRowHeight = 755
        favoriteTableView.estimatedRowHeight = 450
        // テーブル行の高さをAutoLayoutで自動調整
        favoriteTableView.rowHeight = UITableView.automaticDimension
        
        // ナビゲーションを透明にする処理
        //self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        // NavigationBarの下線部を消す処理
        // self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
        // NavigationBar設定
        self.title = "かかりつけ"
        // iOS 11 からの機能
        // if #available(iOS 11.0, *) {
            // Large Title有効 TODO: 有効にするとスクロール時、AMScrollingNavbarでcellが一部隠れる事象発生
            // self.navigationController?.navigationBar.prefersLargeTitles = true
        // }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // スクロールのしきい値を超えた場合NavigationBarを隠す
        if let navigationController = navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(favoriteTableView, delay: 30.0)
        }
    }
}

extension FavoriteViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FavoriteTableViewCell
        // cell.contentView.backgroundColor = UIColor.lightGray
        // self.hero.isEnabled = true
        if indexPath.row == 0 {
            // cell.pagerView.isUserInteractionEnabled = true
            cell.pagerView.hero.id = "institutionImageView"
            //cell.institutionImageView.hero.id = "institutionImageView"
            cell.institutionNameLabel.hero.id = "institutionNameLabel"
            cell.institutionNameLabel.text = "GENOVAかかりつけ医院"
            cell.pagerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleInstitutionViewButton(gestureRecognizer:))))

            //cell.institutionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleInstitutionViewButton(gestureRecognizer:))))
        }
        
        //setup blur vibrant view
        // cell.institutionImageView.blurView.setup(style: UIBlurEffectStyle.dark, alpha: 1).enable()
        
        return cell
    }
    
    @objc func handleInstitutionViewButton(gestureRecognizer: UITapGestureRecognizer) {
        let institutionViewController = InstitutionViewController(nibName: "InstitutionViewController", bundle: nil)
        // self.navigationController?.show(institutionViewController, sender: nil)
        self.present(institutionViewController, animated: true, completion: nil)
    }
}
