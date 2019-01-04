import UIKit

import Hero

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

        // テーブルセルのタップを無効にする
        keywordSearchTableView.allowsSelection = false

        let nib = UINib(nibName: "KeywordSearchTableViewCell", bundle: nil)
        keywordSearchTableView.register(nib, forCellReuseIdentifier: "Cell")
        
        setupTextFields()
        
        // テーブル行の高さをAutoLayoutで自動調整する
        keywordSearchTableView.rowHeight = UITableView.automaticDimension
        // テーブル行の高さの概算値を設定しておく
        // keywordSearchTableView.estimatedRowHeight = UIScreen.main.bounds.width + 600
        keywordSearchTableView.estimatedRowHeight = 270
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
}

extension KeywordSearchViewController {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! KeywordSearchTableViewCell
        cell.institutionNameLabel.text = "GENOVAかかりつけ医院"
        cell.institutionAddressLabel.text = "東京都渋谷区宇田川町10-3 Daiwa SHIBUYA EDGEビル5F"
        //cell.
        /*
         if indexPath.row == 0 || indexPath.row == 3 {
         cell.institutionImageView?.isHidden = true
         cell.imageViewHeight.constant = 0
         cell.cardHeight.constant = 300
         } else {
         cell.institutionImageView?.isHidden = false
         cell.imageViewHeight.constant = 300
         cell.cardHeight.constant = 600
         }
         
         if indexPath.row == 1 {
         // cell.cardView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         // cell.institutionImageView.hero.id = "institutionImageView"
         // cell.name.hero.id = "nameLabel"
         // cell.cardView.isUserInteractionEnabled = true
         cell.cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector(("handleInstitutionViewButton:"))))
         }
         */
        //cell.cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: Selector(("handleInstitutionViewButton:"))))
        
        if indexPath.row == 1 {
            cell.institutionImageView.hero.id = "institutionImageView"
            cell.institutionNameLabel.hero.id = "institutionNameLabel"
            // cell.institutionAddressLabel.hero.id = "institutionAddressLabel"
            //cell.cardView.hero.modifiers = [.translate(y: 500), .useGlobalCoordinateSpace]
            cell.cardView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleInstitutionViewButton(gestureRecognizer:))))
        }
        return cell
    }

    @objc func handleInstitutionViewButton(gestureRecognizer: UITapGestureRecognizer) {
        let institutionViewController = InstitutionViewController(nibName: "InstitutionViewController", bundle: nil)
        self.present(institutionViewController, animated: true, completion: nil)
    }

    /*
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     
     keywordSearchTableView.estimatedRowHeight = 600 //セルの高さ
     return UITableView.automaticDimension //自動設定
     }
     */
}
