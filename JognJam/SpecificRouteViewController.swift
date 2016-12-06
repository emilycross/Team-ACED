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
    
    /* Maintain user and music player */
    var user = userProfile()
    var player = musicPlayer()
    
    @IBOutlet weak var profilePictureButton: UIButton!

    @IBOutlet weak var routeNumberLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    /* Current route */
    var routeNumber = 0
    /* Array of locations retrieved from the CoreLocation class */
    var locations = [CLLocation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Make status bar visible */
        UIApplication.sharedApplication().statusBarStyle = .LightContent
        
        /* Update profile picture */
        profilePictureButton.setImage(user.picture, forState: UIControlState.Normal)
        
        /* Get locations from user */
        locations = user.routeLocations[0]
        
        /* Display current route number */
        routeNumberLabel.text = "Route " + String(routeNumber)
        
        /* Set delegate for mapView */
        mapView.delegate = self
        for i in 0...3 {//(locations.count-2) {
            /* Draw routes between each set of locations */
            let srcLoc = locations[i]
            let srcCoor = srcLoc.coordinate
            let destLoc = locations[i+1]
            let destCoor = destLoc.coordinate
            let srcPlacemark = MKPlacemark(coordinate: srcCoor, addressDictionary: nil)
            let destPlacemark = MKPlacemark(coordinate: destCoor, addressDictionary: nil)
            let srcMapItem = MKMapItem(placemark: srcPlacemark)
            let destMapItem = MKMapItem(placemark: destPlacemark)
            let srcAnnotation = MKPointAnnotation()
            
            /* Annotate each location */
            srcAnnotation.title = "Location "+String(i)
            srcAnnotation.coordinate = srcCoor
            let destAnnotation = MKPointAnnotation()
            destAnnotation.title = "Location "+String(i+1)
            destAnnotation.coordinate = destCoor
            
            /* Show annotations and locations on map view */
            self.mapView.showAnnotations([srcAnnotation, destAnnotation], animated: true)
            let dirRequest = MKDirectionsRequest()
            dirRequest.source = srcMapItem
            dirRequest.destination = destMapItem
            dirRequest.transportType = MKDirectionsTransportType.Walking
            
            /* Get directions */
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
                
                /* Draws red line for route */
                let rect = route.polyline.boundingMapRect
                self.mapView.setRegion(MKCoordinateRegionForMapRect(rect), animated: true)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func mapView(mapView: MKMapView, rendererForOverlay overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.redColor()
        renderer.lineWidth = 4.0
        return renderer
    }
    
    /* Segue preparation */
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
}
