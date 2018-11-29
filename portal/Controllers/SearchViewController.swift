//
//  SearchViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/17.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import PagingMenuController

class SearchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let options = PagingMenuOptions()
        let pagingMenuController = PagingMenuController(options: options)
        
        // 高さ調整。この2行を追加
        pagingMenuController.view.frame.origin.y += 50
        pagingMenuController.view.frame.size.height -= 50
        
        addChild(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMove(toParent: self)
    }
    
    private struct PagingMenuOptions: PagingMenuControllerCustomizable {
        
        //let vc1 = UIStoryboard(name: ConstStoryBoard.searchName, bundle: nil).instantiateViewController(withIdentifier: ConstStoryBoard.keywordSearchId) as! KeywordSearchViewController
        //let vc2 = UIStoryboard(name: ConstStoryBoard.searchName, bundle: nil).instantiateViewController(withIdentifier: ConstStoryBoard.mapSearchId) as! MapSearchViewController
        
        let vc1 = KeywordSearchViewController(nibName: "KeywordSearchViewController", bundle: nil)
        let vc2 = MapSearchViewController(nibName: "MapSearchViewController", bundle: nil)

        
        fileprivate var componentType: ComponentType {
            return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
        }
        
        fileprivate var pagingControllers: [UIViewController] {
            return [vc1, vc2]
        }
        
        fileprivate struct MenuOptions: MenuViewCustomizable {
            var displayMode: MenuDisplayMode {
                return .segmentedControl
            }
            var height: CGFloat {
                return 47
            }
            var backgroundColor: UIColor {
                return UIColor.white
            }
            var selectedBackgroundColor: UIColor {
                return UIColor.white
            }
            var focusMode: MenuFocusMode {
                return .underline(height: 2, color: UIColor.darkGray, horizontalPadding: 40, verticalPadding: 0)
            }
            var itemsOptions: [MenuItemViewCustomizable] {
                return [MenuItem1(), MenuItem2()]
            }
        }
        
        fileprivate struct MenuItem1: MenuItemViewCustomizable {
            var displayMode: MenuItemDisplayMode {
                return .text(title: MenuItemText(text: ConstTitle.keywordSearch, color: UIColor.darkGray, selectedColor: UIColor.black, font: UIFont.systemFont(ofSize: 14), selectedFont:UIFont.boldSystemFont(ofSize: 14)))
            }
        }
        
        fileprivate struct MenuItem2: MenuItemViewCustomizable {
            var displayMode: MenuItemDisplayMode {
                return .text(title: MenuItemText(text: ConstTitle.mapSearch, color: UIColor.darkGray, selectedColor: UIColor.black, font: UIFont.systemFont(ofSize: 14), selectedFont:UIFont.boldSystemFont(ofSize: 14)))
            }
        }
    }
    
}
