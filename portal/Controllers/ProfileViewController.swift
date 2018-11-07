//
//  ProfileViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import MaterialComponents.MDCAppBarNavigationController
import MaterialComponents.MaterialButtons_ButtonThemer

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var profileViewTable: UITableView!
    
    @IBOutlet weak var loginButton: MDCButton!
    
    let tableList = ["設定"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.navigationController?.setNavigationBarHidden(false, animated: true)
        // Do any additional setup after loading the view.
        // let profileTableView = Bundle.main.loadNibNamed("ProfileTableView", owner: self, options: nil)!.first as! ProfileTableView
        // self.view.addSubview(profileTableView)
        profileViewTable.delegate = self
        profileViewTable.dataSource = self
        
        // wellcomLabel.sizeToFit()
        
        let nib = UINib(nibName: "ProfileTableViewCell", bundle: nil)
        profileViewTable.register(nib, forCellReuseIdentifier: "Cell")
        
        // Cell内の高さ
        profileViewTable.rowHeight = 65.0
        // TableViewの余計なcellを打ち消す
        profileViewTable.tableFooterView = UIView()
    
        let frame = CGRect(x: 0, y: 0, width: profileViewTable.frame.width, height:1)
        profileViewTable.tableHeaderView = UIView(frame: frame)
        
        buttonSetup()
    }
    
    private func buttonSetup() {
        //let backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        
        let buttonScheme = MDCButtonScheme()
        MDCContainedButtonThemer.applyScheme(buttonScheme, to: loginButton)
        loginButton.addTarget(self, action: #selector(handleLoginButton(_:forEvent:)), for: .touchUpInside)
    }
    
    @objc func handleLoginButton (_ sender: UIButton, forEvent event: UIEvent) {
        let registLoginSelectViewController = RegistLoginSelectViewController(nibName: "RegistLoginSelectViewController", bundle: nil)
        let navigationController = MDCAppBarNavigationController(rootViewController: registLoginSelectViewController)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProfileTableViewCell
        cell.cellLabel.text = self.tableList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
/*
        if indexPath.row == 0 {
            // 新規登録ボタンはRegistViewControllerをモーダルで表示する
            let registViewController = RegistViewController(nibName: "RegistViewController", bundle: nil)
            let navigationController = MDCAppBarNavigationController(rootViewController: registViewController)
            self.present(navigationController, animated: true, completion: nil)
        }
        else if indexPath.row == 1 {
            // ログインボタンはLoginViewControllerをモーダルで表示する
            let loginViewController = LoginViewController(nibName: "LoginViewController", bundle: nil)
            let navigationController = MDCAppBarNavigationController(rootViewController: loginViewController)
            self.present(navigationController, animated: true, completion: nil)
        }
        else if indexPath.row == 2 {
            // 設定はSettingViewControllerをモーダルで表示する
            let settingViewController = SettingViewController(nibName: "SettingViewController", bundle: nil)
            let navigationController = MDCAppBarNavigationController(rootViewController: settingViewController)
            self.present(navigationController, animated: true, completion: nil)
        }
 */
        if indexPath.row == 0 {
            // 設定はSettingViewControllerをモーダルで表示する
            let settingViewController = SettingViewController(nibName: "SettingViewController", bundle: nil)
            // let navigationController = MDCAppBarNavigationController(rootViewController: settingViewController)
            // self.present(navigationController, animated: true, completion: nil)
            //self.present(settingViewController, animated: true, completion: nil)
            self.navigationController?.show(settingViewController, sender: nil)
            // self.navigationController?.show(navigationController, sender: nil)

        }
        // 遷移戻り時のCellのグレーアウトを戻す
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
