//
//  ViewController.swift
//  SwiftMap
//
//  Created by 野口央介 on 2019/07/26.
//  Copyright © 2019 Osuke Noguchi. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let location:CLLocationCoordinate2D =
        CLLocationCoordinate2DMake(35.658581, 139.745433)
        
        mapView.setCenter(location, animated: true)
        
        var region:MKCoordinateRegion = mapView.region
        region.center = location
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        
        mapView.setRegion(region, animated: true)
        
        mapView.mapType = .hybrid
        
        mapView.delegate = self
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(location.latitude, location.longitude)
        annotation.title = "東京タワー"
        mapView.addAnnotation(annotation)
        
    }


    @IBAction func reload(_ sender: Any) {
       
        count = count + 1
        if count == 1 {
            mapView.mapType = .standard
        }else if count == 2{
            mapView.mapType = .hybridFlyover
        }else if count == 2{
            mapView.mapType = .hybridFlyover
        }else if count == 3{
            mapView.mapType = .mutedStandard
        }else if count == 4{
            mapView.mapType = .satellite
        }else if count == 5{
            mapView.mapType = .satelliteFlyover
        }else if count == 6{
            mapView.mapType = .hybrid
            count = 0
        }
        
    }
    
}

