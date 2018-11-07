//
//  FavoriteViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//
import FoldingCell
import UIKit

class FavoriteViewController: UITableViewController {
    
    @IBOutlet var favoriteTableView: UITableView!
    
    enum Const {
        static let closeCellHeight: CGFloat = 96
        static let openCellHeight: CGFloat = 260
        static let rowsCount = 10
    }
    
    var cellHeights: [CGFloat] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        
        let nib = UINib(nibName: "FavoriteTableViewCell", bundle: nil)
        favoriteTableView.register(nib, forCellReuseIdentifier: "Cell")
        
        cellHeights = Array(repeating: Const.closeCellHeight, count: Const.rowsCount)
        favoriteTableView.estimatedRowHeight = Const.closeCellHeight
        favoriteTableView.rowHeight = UITableView.automaticDimension
        // favoriteTableView.backgroundColor = UIColor.gray
        if #available(iOS 10.0, *) {
            favoriteTableView.refreshControl = UIRefreshControl()
            favoriteTableView.refreshControl?.addTarget(self, action: #selector(refreshHandler), for: .valueChanged)
        }
    }
    
    @objc func refreshHandler() {
        let deadlineTime = DispatchTime.now() + .seconds(1)
        DispatchQueue.main.asyncAfter(deadline: deadlineTime, execute: { [weak self] in
            if #available(iOS 10.0, *) {
                self?.favoriteTableView.refreshControl?.endRefreshing()
            }
            self?.favoriteTableView.reloadData()
        })
    }
}

// MARK: - TableView

extension FavoriteViewController {
    
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return Const.rowsCount
    }
    
    override func tableView(_: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard case let cell as FavoriteTableViewCell = cell else {
            return
        }
        
        cell.backgroundColor = .clear
        
        if cellHeights[indexPath.row] == Const.closeCellHeight {
            cell.unfold(false, animated: false, completion: nil)
        } else {
            cell.unfold(true, animated: false, completion: nil)
        }
        
        // cell.number = indexPath.row
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FavoriteTableViewCell
        let durations: [TimeInterval] = [0.26, 0.2, 0.2]
        cell.durationsForExpandedState = durations
        cell.durationsForCollapsedState = durations
        return cell
    }
    
    override func tableView(_: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! FavoriteTableViewCell
        
        if cell.isAnimating() {
            return
        }
        
        var duration = 0.0
        let cellIsCollapsed = cellHeights[indexPath.row] == Const.closeCellHeight
        if cellIsCollapsed {
            cellHeights[indexPath.row] = Const.openCellHeight
            cell.unfold(true, animated: true, completion: nil)
            duration = 0.5
        } else {
            cellHeights[indexPath.row] = Const.closeCellHeight
            cell.unfold(false, animated: true, completion: nil)
            duration = 0.8
        }
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { () -> Void in
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
    }
}
