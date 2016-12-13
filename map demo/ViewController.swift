//
//  ViewController.swift
//  map demo
//
//  Created by Animesh Manglik on 12/13/16.
//  Copyright © 2016 Animesh Manglik. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate  {

    @IBOutlet var mapViewDemo: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitute: CLLocationDegrees = 34.0087641
        
        let longitude: CLLocationDegrees = -118.5000063
        
        let latDelta: CLLocationDegrees = 0.05
        
        let longDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitute, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        mapViewDemo.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Santa Monica Pier"
        annotation.subtitle = "Once upon a time"
        
        annotation.coordinate = location
        
        mapViewDemo.addAnnotation(annotation)
        
        let longPressRecGesture = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gestureRecognizer:)))
        
        longPressRecGesture.minimumPressDuration = 2
        
        mapViewDemo.addGestureRecognizer(longPressRecGesture)
        
    }
    
    func longPress(gestureRecognizer: UILongPressGestureRecognizer) {
        
        let touchPoint = gestureRecognizer.location(in: self.mapViewDemo)
        
        let coordinate = mapViewDemo.convert(touchPoint, toCoordinateFrom: self.mapViewDemo)
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        
        annotation.title = "Woah"
        
        mapViewDemo.addAnnotation(annotation)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

