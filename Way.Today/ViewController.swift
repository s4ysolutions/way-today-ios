//
//  ViewController.swift
//  Way.Today
//
//  Created by Sergey Dolin on 06/07/2019.
//  Copyright © 2019 S4Y Solutions. All rights reserved.
//

import UIKit
import Rasat
import CoreLocation

class ViewController: UIViewController {
  @IBOutlet var buttonOnOff: UIButton!
  @IBOutlet var buttonSoundOnOff: UIButton!
  @IBOutlet var labelOff: UILabel!
  @IBOutlet var labelOn: UILabel!
  @IBOutlet var ledGPS: UIImageView!
  @IBOutlet var ledPin: UIImageView!
  @IBOutlet var ledUpload: UIImageView!


  private let imageLedBlue = UIImage(named: "led_rect_blue")
  private let imageLedGreen = UIImage(named: "led_rect_green")
  private let imageLedRed = UIImage(named: "led_rect_red")
  private let imageLedOff = UIImage(named: "led_rect_yellow")
  private let locationService: LocationService
  private var disposeBag: DisposeBag?
  private var waytoday: WayTodayState

  init(waytoday: WayTodayState, locationService: LocationService) {
    self.waytoday = waytoday
    self.locationService = locationService
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    waytoday = WayTodayStateDefault.shared
    self.locationService = LocationServiceDefault.shared(log: LogDefault.shared, wayTodayState: waytoday)
    super.init(coder: aDecoder)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    labelOn.isHidden = true
    labelOff.isHidden = true
    setButtonOnOffImage()
    setButtonSoundOnOffImage()
    setLedGPS(status: locationService.status)
    doSubscriptions()
  }

  override func viewDidDisappear(_ animated: Bool) {
    disposeBag?.dispose()
    disposeBag = nil
    super.viewDidDisappear(animated)
  }

  private func doSubscriptions(){
    disposeBag = DisposeBag()
    disposeBag!.add(locationService.observableStatus.subscribe(id: "vc", handler:{status in
      self.setLedGPS(status: status)
    }))
    disposeBag!.add(locationService.observableLocation.subscribe(handler: {
      location in
      self.lightLedPin()
    }))
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction
  func clickOnOff(_ sender: UIButton) {
    waytoday.on = !waytoday.on
    setButtonOnOffImage()
    let labelToAnimate = waytoday.on ? labelOn : labelOff
    if (labelToAnimate != nil) {
      labelToAnimate!.alpha=1.0
      labelToAnimate!.isHidden = false
      UIView.animate(withDuration: 1.0,
                     animations: {labelToAnimate!.alpha=0.0},
                     completion: {ok in labelToAnimate!.isHidden = true})
      /*
       UIView.transition(with: labelToAnimate!,
       duration: 2.0,
       options: [.transitionCurlUp],
       animations: {
       labelToAnimate!.alpha=0.0

       },
       completion: {
       ok in
       labelToAnimate!.isHidden = true

       })
       */
    }
  }

  private func setButtonOnOffImage() {
    if waytoday.on {
      buttonOnOff.setImage( UIImage(named: "on"), for: UIControl.State.normal)
    }else{
      buttonOnOff.setImage( UIImage(named: "off"), for: UIControl.State.normal)
    }
  }

  @IBAction
  func clickSoundOnOff(_ sender: UIButton) {
    waytoday.soundOn = !waytoday.soundOn
    setButtonSoundOnOffImage()
  }

  private func setButtonSoundOnOffImage() {
    if waytoday.soundOn {
      buttonSoundOnOff.setImage( UIImage(named: "sound_on"), for: UIControl.State.normal)
    }else{
      buttonSoundOnOff.setImage( UIImage(named: "sound_off"), for: UIControl.State.normal)
    }
  }

  private let locationManager = CLLocationManager()
  private func setLedGPS(status: LocationServiceStatus){
    switch status {
    case LocationServiceStatus.started:
      ledGPS.image = imageLedGreen
    case LocationServiceStatus.stopped:
      ledGPS.image = imageLedOff
    case LocationServiceStatus.needAuthorization:
      locationManager.requestAlwaysAuthorization()
      ledGPS.image = imageLedRed
    default:
      ledGPS.image = imageLedRed
    }
  }

  private var ledPinAnimation = false
  private var i = 0
  private func lightLedPin(){
    if (ledPinAnimation) {
      print("skip")
      return
    }
    ledPinAnimation = true
    self.ledPin.image = self.imageLedBlue

    print("green")
    DispatchQueue.main.asyncAfter(deadline: .now()+0.25, execute: {
      self.ledPin.image = self.imageLedOff
      self.ledPinAnimation = false
      print("off")
    })
  }
}

