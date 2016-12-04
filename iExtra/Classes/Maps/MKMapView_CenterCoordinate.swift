//
//  MKMapView_Center.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-09-18.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import MapKit

public extension MKMapView {
    
    public func center(onAnnotations annotations: [MKAnnotation], padding: CGFloat, animated: Bool) {
        var coordinates = annotations.map { $0.coordinate }
        center(onCoordinates: coordinates, padding: padding, animated: animated)
    }
    
    public func center(onCoordinate coordinate: CLLocationCoordinate2D, animated: Bool) {
        center(onCoordinate: coordinate, heading: 0.0, animated: animated)
    }
    
    public func center(onCoordinate coordinate: CLLocationCoordinate2D, heading: Double, animated: Bool) {
        guard let newCamera = camera.copy() as? MKMapCamera else { return }
        newCamera.centerCoordinate = coordinate
        newCamera.heading = heading
        setCamera(newCamera, animated: animated)
    }
    
    public func center(onCoordinates coordinates: [CLLocationCoordinate2D], padding: CGFloat, animated: Bool) {
        guard coordinates.count > 0 else { return }
        var rect = MKMapRectNull
        var points = coordinates.map { MKMapPointForCoordinate($0) }
        var rects = points.map { MKMapRectMake($0.x, $0.y, 0.1, 0.1) }
        rects.forEach { rect = MKMapRectUnion(rect, $0) }
        let insets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        setVisibleMapRect(rect, edgePadding: insets, animated: animated)
    }
    
    public func centerOnUserLocation(animated: Bool) {
        let coordinate = userLocation.coordinate
        if coordinate.isValid {
            center(onCoordinate: coordinate, animated: animated)
        }
    }
}
