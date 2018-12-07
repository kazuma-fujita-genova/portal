//
//  FavoriteTableViewCell.swift
//  portal
//
//  Created by 藤田和磨 on 2018/11/19.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import FSPagerView
import MaterialComponents.MaterialButtons_ButtonThemer

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var institutionView: UIStackView!
    
    //@IBOutlet weak var institutionImageView: UIImageView!
    
    @IBOutlet weak var institutionNameLabel: UILabel!
    
    @IBOutlet weak var nextReserveButton: UIButton!
    
    var datePicker: UIDatePicker = UIDatePicker()
    
    @IBOutlet weak var pageControl: FSPageControl! {
        didSet {
            self.pageControl.contentHorizontalAlignment = .center
            self.pageControl.contentInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }
    
    fileprivate var coverflowContents: [Coverflow] = [] {
        didSet {
            self.pagerView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        buttonSetup()
        setupPagerView()
        setupDatePicker()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func buttonSetup() {
        //let backgroundColor = UIColor(white: 0.1, alpha: 1.0)
        
        //let buttonScheme = MDCButtonScheme()
        //MDCContainedButtonThemer.applyScheme(buttonScheme, to: nextReserveButton)
        // nextReserveButton.addTarget(self, action: #selector(handleNextReserveButton(_:forEvent:)), for: .touchUpInside)
    }
    
    @objc func handleNextReserveButton (_ sender: UIButton, forEvent event: UIEvent) {
    }
    
    private func setupDatePicker() {
    }
    
    private func setupPagerView() {
        //UICollectionViewとほとんど同じ感じで設定ができる
        
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.isInfinite = true
        // エフェクト coverFlow .linear, .overlap などは以下を有効にする
        pagerView.itemSize = CGSize(width: 300, height: 205)
        // pagerView.itemSize = FSPagerView.automaticSize
        pagerView.interitemSpacing = 16
        pagerView.transformer = FSPagerViewTransformer(type: .linear)
        // エフェクト .crossFading, .zoomOut, .depth のときは以下を有効
        // pagerView.transformer = FSPagerViewTransformer(type: .depth)
        // pagerView.itemSize = FSPagerView.automaticSize
        // pagerView.decelerationDistance = 1
        
        // Automatic Slider
        // pagerView.automaticSlidingInterval = 4
        
        // 画像をmodelから取得
        coverflowContents = Coverflow.getSampleData()
        
        // pageControl設定
        pageControl.numberOfPages = coverflowContents.count
        pageControl.itemSpacing = 5
        pageControl.interitemSpacing = 10
        
        pagerView.addSubview(pageControl)
    }
    
}

//MARK: - FSPagerViewDataSource, FSPagerViewDelegate

extension FavoriteTableViewCell: FSPagerViewDataSource, FSPagerViewDelegate {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return coverflowContents.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        let coverflow = coverflowContents[index]
        
        cell.contentView.layer.shadowOpacity = 0.4
        cell.contentView.layer.opacity = 0.86
        
        cell.imageView?.image = coverflow.thumbnail
        cell.imageView?.contentMode = .scaleAspectFill
        //cell.imageView?.contentMode = .scaleAspectFit
        cell.imageView?.clipsToBounds = true
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }
}

//MARK: -

// class DatePickerKeyboard: MDCButton {
class DatePickerKeyboard: UIButton {
    private var datePicker: UIDatePicker!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commoninit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commoninit()
    }
    private func commoninit() {
        // datePickerの設定
        /*
        datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ja")
        datePicker.addTarget(self, action: #selector(setText), for: .valueChanged)
        */


        // textFieldのtextに日付を表示する
        setText()
        
        //inputView = datePicker
        //inputAccessoryView = createToolbar()
    }
    
    
    override var inputView: UIView? {
        // datePickerの設定
        datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "ja")
        datePicker.addTarget(self, action: #selector(setText), for: .valueChanged)

        return datePicker
    }
    
    // キーボードのアクセサリービューを作成する
    override var inputAccessoryView: UIView? {
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 44)
        
        let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
        space.width = 12
        let flexSpaceItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let todayButtonItem = UIBarButtonItem(title: "今日", style: .done, target: self, action: #selector(todayPicker))
        let doneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePicker))
        
        let toolbarItems = [flexSpaceItem, todayButtonItem, doneButtonItem, space]
        
        toolbar.setItems(toolbarItems, animated: true)
        
        return toolbar
    }
    
    // キーボードの完了ボタンタップ時に呼ばれる
    @objc private func donePicker() {
        resignFirstResponder()
    }
    // キーボードの今日ボタンタップ時に呼ばれる
    @objc private func todayPicker() {
        datePicker.date = Date()
        setText()
    }
    
    // datePickerの日付けをtextFieldのtextに反映させる
    @objc private func setText() {
        let f = DateFormatter()
        f.dateStyle = .long
        f.locale = Locale(identifier: "ja")
        
        // titleLabel?.text = f.string(from: datePicker.date)
    }
    
    // クラス外から日付を取り出すためのメソッド
    func getDate() -> Date {
        return datePicker.date
    }
    
    // コピペ等禁止
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
}
