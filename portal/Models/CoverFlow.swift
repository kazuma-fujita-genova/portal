//
//  CoverFlow.swift
//  portal
//
//  Created by 藤田和磨 on 2018/11/29.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit

struct Coverflow {
    
    //メンバ変数（ダミーデータを作成する）
    let id: Int
    let thumbnail: UIImage
    
    //イニシャライザ
    init(id: Int, thumbnail: UIImage) {
        self.id        = id
        self.thumbnail = thumbnail
    }
    
    static func getSampleData() -> [Coverflow] {
        return [
            Coverflow(
                id: 1,
                thumbnail: UIImage.init(named: "coverflow1")!
            ),
            Coverflow(
                id: 2,
                thumbnail: UIImage.init(named: "coverflow2")!
            ),
            Coverflow(
                id: 3,
                thumbnail: UIImage.init(named: "coverflow3")!
            ),
            Coverflow(
                id: 4,
                thumbnail: UIImage.init(named: "coverflow4")!
            ),
            Coverflow(
                id: 5,
                thumbnail: UIImage.init(named: "coverflow5")!
            ),
            /*
            Coverflow(
                id: 6,
                thumbnail: UIImage.init(named: "coverflow6")!
            ),
            Coverflow(
                id: 7,
                thumbnail: UIImage.init(named: "coverflow7")!
            ),
            Coverflow(
                id: 8,
                thumbnail: UIImage.init(named: "coverflow8")!
            ),
            */
        ]
    }
}

