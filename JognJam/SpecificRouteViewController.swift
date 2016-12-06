//
//  SpecificRouteViewController.swift
//  JognJam
//
//  Created by Team-ACED on 2016-11-17.
//  Copyright © 2016 Team ACED. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SpecificRouteViewController: UIViewController, MKMapViewDelegate {
    
    var user = userProfile()
    var player = musicPlayer()
    
    var routeNumber = 0
    var locations = [CLLocation]()
    
    @IBOutlet weak var routeNumberLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var profilePictureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Makes the status bar visible
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
        
        locations = user.routeLocations[0]
        
        routeNumberLabel.text = "Route " + String(routeNumber)
        mapView.delegate = self
        print(locations)
        print(user.routeLocations[0])
        for i in 0...3 {//(locations.count-2) {
            let srcLoc = locations[i]
            let srcCoor = srcLoc.coordinate
            let destLoc = locations[i+1]
            let destCoor = destLoc.coordinate
            let srcPlacemark = MKPlacemark(coordinate: srcCoor, addressDictionary: nil)
            let destPlacemark = MKPlacemark(coordinate: destCoor, addressDictionary: nil)
            let srcMapItem = MKMapItem(placemark: srcPlacemark)
            let destMapItem = MKMapItem(placemark: destPlacemark)
            let srcAnnotation = MKPointAnnotation()
            srcAnnotation.title = "Location "+String(i)
            srcAnnotation.coordinate = srcCoor
            let destAnnotation = MKPointAnnotation()
            destAnnotation.title = "Location "+String(i+1)
            destAnnotation.coordinate = destCoor
            self.mapView.showAnnotations([srcAnnotation, destAnnotation], animated: true)
            let dirRequest = MKDirectionsRequest()
            dirRequest.source = srcMapItem
            dirRequest.destination = destMapItem
            dirRequest.transportType = MKDirectionsTransportType.Walking
            
            let dir = MKDirections(request: dirRequest)
            dir.calculateDirectionsWithCompletionHandler{
                (response, error) -> Void in
                guard let response = response else {
                    if error != nil {
                        print ("Error with getting directions")
                    }
                    return
                }
                let route = response.routes[0]
                self.mapView.addOverlay((route.polyline), level: MKOverlayLevel.AboveRoads)
                let rect = route.polyline.boundingMapRect
                self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "specificRouteToRoute" {
            let destinationVC = segue.destinationViewController as? RouteViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        else if segue.identifier == "specificRouteToProfile" {
            let destinationVC = segue.destinationViewController as? RouteViewController
            destinationVC?.user = self.user
            destinationVC?.player = self.player
        }
        else if segue.identifier == "specificRouteToLogin" {
            self.user.start = true
            self.player.pause()
        }
        
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.redColor()
        renderer.lineWidth = 4.0
        
        return renderer
    }

}
