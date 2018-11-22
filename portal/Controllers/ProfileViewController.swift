//
//  ProfileViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
// import MaterialComponents.MDCAppBarNavigationController
import MaterialComponents.MaterialButtons_ButtonThemer

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var profileViewTable: UITableView!
    
    @IBOutlet weak var loginButton: MDCButton!
    
    let tableList = ["設定"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // UX向上の為、画面戻りで選択していたcellをハイライト
        profileViewTable.indexPathsForSelectedRows?.forEach {
            profileViewTable.deselectRow(at: $0, animated: true)
        }
    }
    
    private func buttonSetup() {
        //let backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        
        let buttonScheme = MDCButtonScheme()
        MDCContainedButtonThemer.applyScheme(buttonScheme, to: loginButton)
        loginButton.addTarget(self, action: #selector(handleLoginButton(_:forEvent:)), for: .touchUpInside)
    }
    
    @objc func handleLoginButton (_ sender: UIButton, forEvent event: UIEvent) {
        let registLoginSelectViewController = RegistLoginSelectViewController(nibName: "RegistLoginSelectViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: registLoginSelectViewController)
        self.present(navigationController, animated: true, completion: nil)
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
        if indexPath.row == 0 {
            let settingViewController = SettingViewController(nibName: "SettingViewController", bundle: nil)
            self.navigationController?.show(settingViewController, sender: nil)
        }
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
