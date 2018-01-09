//
//  MapViewController.swift
//  EasyReminderTDD
//
//  Created by Marie on 23.12.17.
//  Copyright © 2017 Mariya. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation

class MapViewController: UIViewController {
    
    let initialLocation = CLLocation(latitude: 51.6720400, longitude: 39.1843000)
    let regionRadius: CLLocationDistance = 1000
    var location: String = ""
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        centerMapOnLocation(location: initialLocation)
        
        //cityLabel.text = "Voronezh"
        cityLabel.text = location
        
        //navigationController?.navigationBar.prefersLargeTitles = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
