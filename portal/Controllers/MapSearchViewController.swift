//
//  MapSearchViewController.swift
//  portal
//
//  Created by 藤田和磨 on 2018/10/18.
//  Copyright © 2018 藤田和磨. All rights reserved.
//

import UIKit
import GoogleMaps

class MapSearchViewController: UIViewController {

    @IBOutlet weak var googleMap: GMSMapView!
    //var googleMap : GMSMapView!
    //緯度経度 -> 金沢駅
    let latitude: CLLocationDegrees = 36.5780574
    let longitude: CLLocationDegrees = 136.6486596
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ズームレベル.
        let zoom: Float = 15
        
        // カメラを生成.
        let camera: GMSCameraPosition = GMSCameraPosition.camera(withLatitude: latitude,longitude: longitude, zoom: zoom)
        
        // MapViewを生成.
        /*
        googleMap = GMSMapView(frame: CGRect(x:0, y:0, width: self.view.bounds.width, height: self.view.bounds.height))
        */
        // MapViewにカメラを追加.
        googleMap.camera = camera
        
        //マーカーの作成
        let marker: GMSMarker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(latitude, longitude)
        marker.map = googleMap
        
        
        //viewにMapViewを追加.
        self.view.addSubview(googleMap)
    }
}
