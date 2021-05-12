//
//  MapView.swift
//  ProfessorX
//
//  Created by Ian Gonzalez on 4/29/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State var pins: [Pin] = [
        Pin(title: "Prospect Park", coordinate: .init(latitude: 40.6626035, longitude: -73.9690273)),
        Pin(title: "Statue of Liberty", coordinate: .init(latitude: 40.689249, longitude: -74.044500))
    ]
    var body: some View {
        MapSubView(pins: $pins)
            .edgesIgnoringSafeArea(.all)
    }
}

struct MapSubView: UIViewRepresentable {
    
    @Binding var pins: [Pin]
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
        view.addAnnotations(pins)
    }
    
}

final class Pin: NSObject, MKAnnotation { //simple pin (annotation) class that takes in a title and a coordinate
      let title: String?
      let coordinate: CLLocationCoordinate2D
      
      init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
      }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
