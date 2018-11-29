//
//  CardViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

import PagingMenuController

class CardViewController: UIViewController {
    
    // var cardView = CardView.instance()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.


        let options = PagingMenuOptions()
        let pagingMenuController = PagingMenuController(options: options)
        
        // 高さ調整。この2行を追加
        // pagingMenuController.view.frame.origin.y += 50
        // pagingMenuController.view.frame.size.height -= 50
        // TODO: safeArea / NaviBar を考慮し動的に TabMenuを表示させたい
        // pagingMenuController.view.frame.origin.y += navigationController!.navigationBar.frame.origin.y
        // pagingMenuController.view.frame.size.height -= navigationController!.navigationBar.frame.size.height
        // iPhoneXのsafeArea対策。他画面サイズにも適用させること
        pagingMenuController.view.frame.origin.y += navigationController!.navigationBar.frame.origin.y + 120
        pagingMenuController.view.frame.size.height -= navigationController!.navigationBar.frame.size.height + 120
        
        addChild(pagingMenuController)
        view.addSubview(pagingMenuController.view)
        pagingMenuController.didMove(toParent: self)
        
        // NavigationBar設定
        self.title = "診察券"
        // iOS 11 からの機能
        if #available(iOS 11.0, *) {
            // Large Title
            self.navigationController?.navigationBar.prefersLargeTitles = true
        }
    }
    
    // delegateも用意されているのでハンドリングも可能 TODO:ちゃんと呼ばれるように設定すること
    func willMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
        print(menuController)
        print(previousMenuController)
    }
    // delegateも用意されているのでハンドリングも可能 TODO:ちゃんと呼ばれるように設定すること
    func didMoveToPageMenuController(menuController: UIViewController, previousMenuController: UIViewController) {
    }
    
    private struct PagingMenuOptions: PagingMenuControllerCustomizable {
        
        
        let cardDict:[[String:String?]] = [
            ["name":"本人ハナコ",
             "qr_code_image":"https://contents.nomoca.com/qr/2493/0rlUyeHEDg46qEug.png",
             "relationship": nil
            ],
            ["name":"しんさつ太郎",
             "qr_code_image":"https://contents.nomoca.com/qr/2561/qU1RXxZIhywQirs1.png",
             "relationship":"子"
            ],
            ["name":"しんさつまさつかさん",
             "qr_code_image":"https://contents.nomoca.com/qr/2561/0rlUyeHEDg46qEug.png",
             "relationship":"孫"
            ]
        ]
        
        fileprivate var componentType: ComponentType {
            return .all(menuOptions: MenuOptions(), pagingControllers: pagingControllers)
        }
        
        fileprivate var pagingControllers: [UIViewController] {
            // TODO: モックコード
            var cardViewControllers = [UIViewController]()
            for (index, _) in self.cardDict.enumerated() {
                let cardViewController = UIViewController()
                let cardView = CardView.instance()
                let url = URL(string: self.cardDict[index]["qr_code_image"]! ?? "")
                let data = try? Data(contentsOf: url!)
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    cardView.qrCodeImageView?.image = image
                }
                cardViewController.view.addSubview(cardView)
                cardViewControllers.append(cardViewController)
            }
            // TODO: モックコード
            return cardViewControllers
        }
        
        fileprivate struct MenuOptions: MenuViewCustomizable {
            /*
            var displayMode: MenuDisplayMode {
                return .segmentedControl
            }
            */
            /*
            var displayMode: MenuDisplayMode {
                return .infinite(widthMode: .flexible, scrollingMode: .scrollEnabled)
            }
            */
            
            var displayMode: MenuDisplayMode {
                return .standard(widthMode: .flexible, centerItem: true, scrollingMode: .scrollEnabledAndBouces)
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
            
            var menuSelectedItemCenter: Bool {
                return true
            }
            
            var focusMode: MenuFocusMode {
                return .underline(height: 2, color: UIColor.darkGray, horizontalPadding: 0, verticalPadding: 0)
            }
            var itemsOptions: [MenuItemViewCustomizable] {
                
                // TODO: モックコード
                var menuItems = [MenuItemViewCustomizable]()
                let cardDict:[[String:String?]] = [
                    ["name":"本人ハナコ",
                     "qr_code_image":"https://contents.nomoca.com/qr/2493/0rlUyeHEDg46qEug.png",
                     "relationship": nil
                    ],
                    ["name":"しんさつ太郎",
                     "qr_code_image":"https://contents.nomoca.com/qr/2561/qU1RXxZIhywQirs1.png",
                     "relationship":"子"
                    ],
                     ["name":"しんさつまさつかさん",
                     "qr_code_image":"https://contents.nomoca.com/qr/2561/0rlUyeHEDg46qEug.png",
                     "relationship":"孫"
                     ]
                ]
                for (index, _) in cardDict.enumerated() {
                    let name = cardDict[index]["name"]! ?? ""
                    var menuItem = MenuItem()
                    menuItem.name = name
                    menuItems.append(menuItem)
                }
                // TODO: モックコード
                
                return menuItems
                //return [MenuItem1(), MenuItem2()]
            }
        }

        fileprivate struct MenuItem: MenuItemViewCustomizable {
            
            var name:String = ""
            
            var displayMode: MenuItemDisplayMode {
                return .text(title: MenuItemText(text: self.name, color: UIColor.darkGray, selectedColor: UIColor.black, font: UIFont.systemFont(ofSize: 14), selectedFont:UIFont.boldSystemFont(ofSize: 14)))
            }
        }
        /*
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
        */
    }

    
}
