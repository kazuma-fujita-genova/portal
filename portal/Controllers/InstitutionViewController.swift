//
//  InstitutionViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import Hero
// import MaterialComponents.MaterialAppBar
// import MaterialComponents.MaterialAppBar_ColorThemer
// UX向上
// import SkeletonView

class InstitutionViewController: UIViewController {
    
    @IBOutlet weak var institutionDetailView: UIStackView!
    
    @IBOutlet weak var institutionScrollView: UIScrollView!
    
    @IBOutlet weak var institutionNameLabel: UILabel!
    
    @IBOutlet weak var institutionImageView: UIImageView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //self.view.addSubview(categoryView)
        
        self.hero.isEnabled = true
        institutionImageView.hero.id = "institutionImageView"
        institutionNameLabel.hero.id = "institutionNameLabel"
        // institutionAddressLabel.hero.id = "institutionAddressLabel"
        //institutionDetailView.hero.modifiers = [.translate(y: 500), .useGlobalCoordinateSpace]
        institutionDetailView.hero.modifiers = [.fade, .scale(0.5)]
        
        institutionImageView.isUserInteractionEnabled = true
        institutionImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCancelButton(gestureRecognizer:))))
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
    }
    
    private func setupLabels() {
        //institutionAddressLabel.textColor = UIColor.gray
        //institutionAddressLabel.font = UIFont.systemFont(ofSize: 10)
        //institutionAddressLabel.numberOfLines = 0
        //institutionAddressLabel.sizeToFit()
        //institutionAddressLabel.lineBreakMode = NSLineBreakMode.byCharWrapping
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
