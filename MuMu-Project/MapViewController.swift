//
//  MapViewController.swift
//  MuMu-Project
//
//  Created by Phongsakorn Srikate on 3/6/2566 BE.
//

import UIKit
import GoogleMaps
import CoreLocation
class MapViewController: UIViewController {
    @IBOutlet weak var searchBarView: UIView! {
        didSet {
            searchBarView.layer.cornerRadius = 10.0
            searchBarView.layer.masksToBounds = true
        }
    }
    
    var  mapView: GMSMapView!
    
    let annotationLocations = [
        ["title": "วัดแขก", "latitude": 13.724512067367648, "longitude": 100.52284887099484],
        ["title": "วัดอรุุณ", "latitude": 13.744316479942372, "longitude": 100.4885587260887]
    ]
    
    var myLocationLatitude: Double?
    var myLcationLongitude: Double?
    var placeLocationLatitude: Double?
    var placeLcationLongitude: Double?
    
    let locationManager = CLLocationManager()
    let pulsatingLayer = CAShapeLayer()
    
    var myView: UIView! = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the delegate of the location manager
        locationManager.delegate = self
        // Request location authorization from the user
        locationManager.requestWhenInUseAuthorization()
        
        // Start updating the user's location
        locationManager.startUpdatingLocation()
        
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        //  map.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupSearchBarView()
        setUpCirCleLayers()
        mapView.delegate = self
        createAnnotations(locations: self.annotationLocations)
    }
    
    private func setupSearchBarView() {
        self.view.addSubview(searchBarView)
        searchBarView.translatesAutoresizingMaskIntoConstraints = false
        let searchBarViewTrailingConstraint = searchBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15)
        let searchBarViewLeadingConstraint = searchBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        let searchBarViewBottomConstraint = searchBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        let searchBarViewHeightConstraint = searchBarView.heightAnchor.constraint(equalToConstant: 54)
        NSLayoutConstraint.activate([searchBarViewTrailingConstraint, searchBarViewLeadingConstraint, searchBarViewBottomConstraint, searchBarViewHeightConstraint])
    }
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.draw(in: CGRectMake(0, 0, newSize.width, newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    @IBAction func selectShowDetailLocation() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LocationDetailViewController") as! LocationDetailViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc, animated: true)
    }
    
    private func createAnnotations(locations: [[String: Any]]) {
        for location in locations {
            let position = CLLocationCoordinate2D(latitude: location["latitude"] as! CLLocationDegrees, longitude: location["longitude"] as! CLLocationDegrees)
            let marker = GMSMarker(position: position)
            marker.title = location["title"] as? String
            marker.iconView = myView
            marker.map = mapView
        }
    }
    
    private func setUpCirCleLayers() {
        myView = UIView(frame: CGRect(x: 50, y: 300, width: 110, height: 110))
        myView.backgroundColor = .clear
        self.view.addSubview(myView)
        let viewCenter = CGPoint(x: myView.bounds.midX, y: myView.bounds.midY)
        
        let cirCularPath_2 = UIBezierPath(arcCenter: viewCenter, radius: 40, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        pulsatingLayer.path = cirCularPath_2.cgPath
        pulsatingLayer.fillColor = UIColor(red: 199/255, green: 195/255, blue: 255/255, alpha: 0.7).cgColor
        pulsatingLayer.strokeColor =  UIColor.clear.cgColor
        pulsatingLayer.lineWidth = 10
        myView.layer.addSublayer(pulsatingLayer)
        
        animatePulsatingLayer()
        
        let shapeLayer = CAShapeLayer()
        let cirCularPath = UIBezierPath(arcCenter: viewCenter, radius: 30, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = cirCularPath.cgPath
        shapeLayer.fillColor = UIColor(red: 79/255, green: 72/255, blue: 255/255, alpha: 1).cgColor
        shapeLayer.strokeColor =  UIColor(red: 101/255, green: 95/255, blue: 255/255, alpha: 1).cgColor
        shapeLayer.lineWidth = 5
        myView.layer.addSublayer(shapeLayer)
        
        
        // Example usage
        let image = UIImage(named: "ic_tarot")
        let imageViewFrame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let imageView = createImageView(image: image!, frame: imageViewFrame)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        myView.addSubview(imageView)
        // Set constraints to center the UIImageView
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: myView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: myView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 25),
            imageView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private func animatePulsatingLayer() {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.fromValue = 1.0
        animation.toValue = 1.2
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        pulsatingLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        pulsatingLayer.add(animation, forKey: "pulsatingAnimation")
        
        // Adjust position animation to keep the shape centered
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        let positionAnimation = CABasicAnimation(keyPath: "position")
        positionAnimation.fromValue = pulsatingLayer.position
        positionAnimation.toValue = pulsatingLayer.position
        positionAnimation.duration = 0.5
        positionAnimation.autoreverses = true
        positionAnimation.repeatCount = .infinity
        pulsatingLayer.add(positionAnimation, forKey: "positionAnimation")
        CATransaction.commit()
    }
    
    func createImageView(image: UIImage, frame: CGRect) -> UIImageView {
        let imageView = UIImageView(frame: frame)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    
}

extension MapViewController: CLLocationManagerDelegate {
    
    // Handle location updates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        
        // Get the user's current location coordinates
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        self.myLocationLatitude = latitude
        self.myLcationLongitude = longitude
        // Use the coordinates to set the camera position on the map
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 12.0)
        
        // Create a GMSMapView and set its camera position
        mapView = GMSMapView.map(withFrame: self.view.frame, camera: camera)
        mapView.mapType = .normal
        self.view.addSubview(mapView)
        
        // Add Marker
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        marker.title = "ฉันเอง"
        marker.snippet = "My location"
        //  marker.icon = self.imageWithImage(image: UIImage(named: "ic_man")!, scaledToSize: CGSize(width: 50.0, height: 50.0))
        marker.map = mapView
        // Stop updating the location once you have the user's current location
        locationManager.stopUpdatingLocation()
    }
    
    // Handle location authorization status changes
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            // Permission granted, start updating location
            locationManager.startUpdatingLocation()
        } else {
            // Permission denied or not determined, handle accordingly
        }
    }
}

extension MapViewController: GMSMapViewDelegate {
    
    // tap map marker
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        print("didTap marker \(marker.title)")
        if marker.snippet != "My location" {
            // remove color from currently selected marker
            if let selectedMarker = mapView.selectedMarker {
                selectedMarker.icon = GMSMarker.markerImage(with: nil)
            }
            
            // select new marker and make green
            mapView.selectedMarker = marker
            marker.icon = GMSMarker.markerImage(with: UIColor.green)
            
            // tap event handled by delegate
            self.placeLocationLatitude = marker.layer.latitude
            self.placeLcationLongitude = marker.layer.longitude
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "LocationDetailViewController") as! LocationDetailViewController
            vc.modalPresentationStyle = .overFullScreen
            vc.modalTransitionStyle = .crossDissolve
            vc.myLocationLatitude = self.myLocationLatitude
            vc.myLcationLongitude = self.myLcationLongitude
            vc.placeLocationLatitude = self.placeLocationLatitude
            vc.placeLcationLongitude = self.placeLcationLongitude
            self.present(vc, animated: true)
            return true
        } else {
            return false
        }
    }
}

