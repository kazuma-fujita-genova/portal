//
//  KeywordSearchViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

import MaterialComponents.MaterialTextFields
import MaterialComponents.MaterialAppBar
import MaterialComponents.MaterialAppBar_ColorThemer
import MaterialComponents.MaterialAppBar_TypographyThemer

class KeywordSearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var allTextFieldControllers = [MDCTextInputControllerUnderline]()
    
    @IBOutlet weak var keywordSearchTableView: UITableView!
    
    @IBOutlet weak var searchField: MDCTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        keywordSearchTableView.delegate = self
        keywordSearchTableView.dataSource = self

        let nib = UINib(nibName: "KeywordSearchTableViewCell", bundle: nil)
        keywordSearchTableView.register(nib, forCellReuseIdentifier: "Cell")
        
        setupTextFields()
    }
    
    func setupTextFields() {
        let searchFieldController = MDCTextInputControllerUnderline(textInput: searchField)
        searchField.leadingView = UIImageView(image: UIImage(named:ConstImage.search))
        searchField.leadingViewMode = .always
        searchField.autocapitalizationType = .words
        searchFieldController.placeholderText = "病院名"
        // searchFieldController.helperText = "ヘルプテキスト"
        self.allTextFieldControllers.append(searchFieldController)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! KeywordSearchTableViewCell
        cell.name.text = "マテリアル医院"
        //cell.
        return cell

    }
}
