//
//  MapView.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 4/29/21.
//

import SwiftUI
import MapKit



struct MapView: View {
    var body: some View {
        MapSubView()
    }
}

struct MapSubView: UIViewRepresentable {
    
    var locationManager = CLLocationManager()
       
       func setupManager() {
         locationManager.desiredAccuracy = kCLLocationAccuracyBest
         locationManager.requestWhenInUseAuthorization()
         locationManager.requestAlwaysAuthorization()
       }
    func makeUIView(context: UIViewRepresentableContext<MapSubView>) -> MKMapView {
           setupManager()
           let mapView = MKMapView(frame: UIScreen.main.bounds)
           mapView.showsUserLocation = true
           mapView.userTrackingMode = .follow
           return mapView
       }
       func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapSubView>) {
       }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
