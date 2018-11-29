//
//  FavoriteTableViewCell.swift
//  portal
//
//  Created by 藤田和磨 on 2018/11/19.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import FSPagerView

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var institutionView: UIStackView!
    
    //@IBOutlet weak var institutionImageView: UIImageView!
    
    @IBOutlet weak var institutionNameLabel: UILabel!
    
    
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
        setupPagerView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
