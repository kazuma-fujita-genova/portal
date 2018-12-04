//
//  InstitutionViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import Hero
import FSPagerView
import MXParallaxHeader
// import MaterialComponents.MaterialAppBar
// import MaterialComponents.MaterialAppBar_ColorThemer
// UX向上
// import SkeletonView

class InstitutionViewController: UIViewController {
    
    @IBOutlet weak var institutionDetailView: UIStackView!
    
    @IBOutlet weak var institutionScrollView: UIScrollView!
    
    @IBOutlet weak var institutionNameLabel: UILabel!

    @IBOutlet weak var pageControl: FSPageControl! {
        didSet {
            self.pageControl.contentHorizontalAlignment = .left
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
    
    @IBOutlet weak var categoryView: InstitutionDetailWidgetView!
    
    // imageView
    /*
    let appBarViewController = MDCAppBarViewController()
    var colorScheme = MDCSemanticColorScheme()
    
    deinit {
        // Required for pre-iOS 11 devices because we've enabled observesTrackingScrollViewScrollEvents.
        appBarViewController.headerView.trackingScrollView = nil
    }
    */
    
    //var parallaxScrollView: MXScrollView!
    /*
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        institutionScrollView.parallaxHeader.minimumHeight = topLayoutGuide.length
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //self.view.addSubview(categoryView)
        
        self.hero.isEnabled = true
        // institutionImageView.hero.id = "institutionImageView"
        pagerView.hero.id = "institutionImageView"
        institutionNameLabel.hero.id = "institutionNameLabel"
        // institutionAddressLabel.hero.id = "institutionAddressLabel"
        //institutionDetailView.hero.modifiers = [.translate(y: 500), .useGlobalCoordinateSpace]
        institutionDetailView.hero.modifiers = [.fade, .scale(0.5)]
        
        // institutionImageView.isUserInteractionEnabled = true
        pagerView.isUserInteractionEnabled = true
        pagerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCancelButton(gestureRecognizer:))))
        //institutionImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCancelButton(gestureRecognizer:))))
        // nameLabel.hero.modifiers = [.translate(y: 500), .useGlobalCoordinateSpace]
        
        institutionNameLabel.text = "GENOVAかかりつけ医院"
        // institutionAddressLabel.text = "東京都渋谷区宇田川町10-3 Daiwa SHIBUYA EDGEビル5F"
        
        /////////////
        /*
        guard let widgetView = UINib(nibName: "InstitutionDetailWidgetView", bundle: nil).instantiate(withOwner: InstitutionDetailWidgetView.self, options: nil).first as? InstitutionDetailWidgetView else {
            return
        }
         // IBからひいてきた　InstitutionDetailWidgetView が表示できない
        categoryView.headingLabel?.text = "診療科目"
        categoryView.descriptionLabel?.text = "説明説明"
        */
        /////////////
        
        // UX向上: ローディングのときにスケルトンを表示させる
        /* TODO https://tech.recruit-mp.co.jp/mobile/ios-ux-tips/
        label.isSkeletonable = true
        view.showSkeleton()
        // 擬似的に3秒遅延させる
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            self.view.hideSkeleton()
            self.label.text = "Hoge"
        }
         */
    
        // Create our custom image view and add it to the header view.
        /*
        let headerView = appBarViewController.headerView
        institutionImageView.frame = headerView.bounds
        // Ensure that the image view resizes in reaction to the header view bounds changing.
        institutionImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Ensure that the image view is below other App Bar views (headerStackView).
        headerView.insertSubview(institutionImageView, at: 0)
        
        // Scales up the image while the header is over-extending.
        institutionImageView.contentMode = .scaleAspectFill
        
        // The header view does not clip to bounds by default so we ensure that the image is clipped.
        institutionImageView.clipsToBounds = true
        
        MDCAppBarColorThemer.applyColorScheme(colorScheme, to: appBarViewController)
        
        // Make sure navigation bar background color is clear so the image view is visible.
        appBarViewController.navigationBar.backgroundColor = UIColor.clear
        
        // Allow the header to show more of the image.
        headerView.maximumHeight = 200
        
        // Allows us to avoid forwarding events, but means we can't enable shift behaviors.
        headerView.observesTrackingScrollViewScrollEvents = true
        
        headerView.trackingScrollView = self.institutionScrollView
        
        view.addSubview(appBarViewController.view)
        appBarViewController.didMove(toParent: self)
        
        
        self.title = "Imagery (Swift)"
        
        // Behavioral flags.
        appBarViewController.inferTopSafeAreaInsetFromViewController = true
        appBarViewController.headerView.minMaxHeightIncludesSafeArea = false
        
        self.addChild(appBarViewController)
        */
    
        setupLabels()
        setupPagerView()
        // これコメントインすると画面崩れる
        // setupParallraxView()
        
    }
    
    private func setupLabels() {
        //institutionAddressLabel.textColor = UIColor.gray
        //institutionAddressLabel.font = UIFont.systemFont(ofSize: 10)
        //institutionAddressLabel.numberOfLines = 0
        //institutionAddressLabel.sizeToFit()
        //institutionAddressLabel.lineBreakMode = NSLineBreakMode.byCharWrapping
    }
    
    private func setupParallraxView() {
        //institutionScrollView.parallaxHeader.height = 300
        // institutionScrollView.parallaxHeader.mode = MXParallaxHeaderMode.fill
        // institutionScrollView.parallaxHeader.delegate = self as! MXParallaxHeaderDelegate
        // Parallax Header
        
        //institutionScrollView = MXScrollView()
        institutionScrollView.parallaxHeader.view = pagerView
        institutionScrollView.parallaxHeader.height = 300
        institutionScrollView.parallaxHeader.mode = MXParallaxHeaderMode.fill
        institutionScrollView.parallaxHeader.minimumHeight = 100
        institutionScrollView.contentSize = CGSize(width: 500, height: 300)
        //view.addSubview(institutionScrollView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        /*
        var frame = view.frame
        institutionScrollView.frame = frame
        institutionScrollView.contentSize = frame.size
        frame.size.height -= institutionScrollView.parallaxHeader.minimumHeight
        institutionDetailView.frame = frame
        */
    }
    
    
    private func setupPagerView() {
        //UICollectionViewとほとんど同じ感じで設定ができる
        
        pagerView.delegate = self
        pagerView.dataSource = self
        pagerView.isInfinite = true
        // エフェクト coverFlow .linear, .overlap などは以下を有効にする
        // pagerView.itemSize = CGSize(width: 180, height: 120)
        // pagerView.interitemSpacing = 16
        // pagerView.transformer = FSPagerViewTransformer(type: .coverFlow)
        // エフェクト .crossFading, .zoomOut, .depth のときは以下を有効
        pagerView.transformer = FSPagerViewTransformer(type: .depth)
        pagerView.itemSize = FSPagerView.automaticSize
        pagerView.decelerationDistance = 1
        
        // Automatic Slider
        pagerView.automaticSlidingInterval = 4
        
        // 画像をmodelから取得
        coverflowContents = Coverflow.getSampleData()
        
        // pageControl設定
        pageControl.numberOfPages = coverflowContents.count
        
        pageControl.itemSpacing = 7
        pageControl.interitemSpacing = 10
        
        pagerView.addSubview(pageControl)
    }

    /*
    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.title = "Imagery (Swift)"
        
        // Behavioral flags.
        appBarViewController.inferTopSafeAreaInsetFromViewController = true
        appBarViewController.headerView.minMaxHeightIncludesSafeArea = false
        
        self.addChild(appBarViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    */
    @objc func handleCancelButton(gestureRecognizer: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    /* UX向上:scroll viewを入れた時に一瞬スクロールバーが表示される
    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollView.flashScrollIndicators()
    }
    */
}

//MARK: - FSPagerViewDataSource, FSPagerViewDelegate

extension InstitutionViewController: FSPagerViewDataSource, FSPagerViewDelegate {
    
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

