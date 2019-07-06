//
//  LocationServiceDefault.swift
//  Way.Today
//
//  Created by Sergey Dolin on 06/07/2019.
//  Copyright © 2019 S4Y Solutions. All rights reserved.
//
import Rasat
import CoreLocation

class LocationServiceDefault: NSObject, LocationService{

  private class LocationDelegate: NSObject, CLLocationManagerDelegate {
    let _channelLocation = Channel<CLLocation>()
    var log: Log
    init(log: Log) {
      self.log = log
    }

    func locationManager(_ manager:CLLocationManager, didUpdateLocations locations: [CLLocation]) {
      if (locations.count > 0) {
        _channelLocation.broadcast(locations.last!)
        log.debug("New location")
      }
    }
  }

  var observableLocation: Observable<CLLocation>
  private var subscriptionOn: Disposable?
  private let log: Log
  private let locationManagerDelegate: LocationDelegate
  private let wayTodayState: WayTodayState

  init(log: Log, wayTodayState: WayTodayState) {
    self.log = log
    self.wayTodayState = wayTodayState
    locationManagerDelegate = LocationDelegate(log: log)
    observableLocation = locationManagerDelegate._channelLocation.observable
    super.init()

    if wayTodayState.on {
      start()
    } else {
      stop()
    }
    startObserve()
  }

  deinit {
    stopObserve()
  }

  private func start() {
    let manager = CLLocationManager()
    manager.requestAlwaysAuthorization()
    manager.delegate = locationManagerDelegate
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.startUpdatingLocation()
    self.log.debug("Location Service started")
  }

  private func stop() {
    let manager = CLLocationManager()
    manager.stopUpdatingLocation()
    log.debug("Location Service stopped")
  }

  private func startObserve() {
    log.debug("LocationServiceDefault will subscribe to WayToday state")
    assert(subscriptionOn==nil)
    subscriptionOn = wayTodayState.observableOn.subscribe(handler: {on in
      if on {
        self.start()
      } else {
        self.stop()
      }
    })
    self.log.debug("LocationServiceDefault subscribed to WayToday state")
  }

  private func stopObserve() {
    subscriptionOn?.dispose()
    subscriptionOn = nil
    log.debug("LocationServiceDefault unsubscribed from WayToday state")
  }
}
