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
  @IBOutlet var buttonTid: UIButton!
  @IBOutlet var labelOff: UILabel!
  @IBOutlet var labelOn: UILabel!
  @IBOutlet var labelTid: UILabel!
  @IBOutlet var ledGPS: UIImageView!
  @IBOutlet var ledPin: UIImageView!
  @IBOutlet var ledUpload: UIImageView!

  private let imageLedLightBlue = UIImage(named: "led_rect_lightblue")
  private let imageLedBlue = UIImage(named: "led_rect_blue")
  private let imageLedGreen = UIImage(named: "led_rect_green")
  private let imageLedRed = UIImage(named: "led_rect_red")
  private let imageLedOff = UIImage(named: "led_rect_yellow")
  private let locationService: LocationService
  private var disposeBag: DisposeBag?
  private let TITLE_NO_ID = "No ID"
  private var waytoday: WayTodayState
  private var waytodayService: WayTodayService

  init(waytoday: WayTodayState, locationService: LocationService, waytodayService: WayTodayService) {
    self.waytoday = waytoday
    self.locationService = locationService
    self.waytodayService = waytodayService

    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    waytoday = WayTodayStateDefault.shared
    locationService = LocationServiceDefault.shared(log: LogDefault.shared, wayTodayState: waytoday)
    waytodayService = WayTodayServiceDefault.shared(log: LogDefault.shared, wayTodayState: waytoday)
    super.init(coder: aDecoder)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    labelOn.isHidden = true
    labelOff.isHidden = true
    setButtonOnOffImage()
    setButtonSoundOnOffImage()
    setLedGPS(status: locationService.status)
    ledUpload.image = imageLedOff
    setTid()
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
    disposeBag!.add(UploaderDefault
      .shared(log: LogDefault.shared, wayTodayState: waytoday)
      .observableState
      .subscribe(id:"uploadedController", handler: {uploaderState in
        DispatchQueue.main.async {
          switch(uploaderState){
          case UploaderState.UPLOADING:
            self.ledUpload.image = self.imageLedLightBlue
          case UploaderState.ERROR:
            self.ledUpload.image = self.imageLedRed
          default:
            self.ledUpload.image = self.imageLedOff
          }
        }
      })
    )
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    if (waytoday.tid == "") {
      requestTid()
    }
  }

  @IBAction
  func clickTid(_ sender: UIButton) {
    requestTid()
  }

  var gettingTid = false
  private func requestTid() {
    if gettingTid {
      return
    }
    gettingTid = true
    buttonTid.isEnabled = false
    do {
      try waytodayService.generateTid(prevTid: waytoday.tid, complete: { tid in
        DispatchQueue.main.sync {
          self.buttonTid.isEnabled = true
          self.waytoday.tid = tid
          self.setTid()
          self.gettingTid = false
        }
      })
    }catch{
      gettingTid = false
      print(error)
    }
  }

  private func setTid() {
    labelTid.text = waytoday.tid == "" ? TITLE_NO_ID : waytoday.tid
  }

  @IBAction
  func clickOnOff(_ sender: UIButton) {
    /*
     let formatter = DateFormatter()
     formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
     let payload = formatter.string(from: Date())

     waytodayService.ping(payload: payload)
     */
    waytoday.on = !waytoday.on
    setButtonOnOffImage()
    let labelToAnimate = waytoday.on ? labelOn : labelOff
    if (labelToAnimate != nil) {
      labelToAnimate!.alpha=1.0
      labelToAnimate!.isHidden = false
      UIView.animate(withDuration: 1.0,
                     animations: {labelToAnimate!.alpha=0.0},
                     completion: {ok in labelToAnimate!.isHidden = true})
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
      return
    }
    ledPinAnimation = true
    self.ledPin.image = self.imageLedBlue

    DispatchQueue.main.asyncAfter(deadline: .now()+0.25, execute: {
      self.ledPin.image = self.imageLedOff
      self.ledPinAnimation = false
    })
  }
  
  @IBAction func clickMapButton(_ sender: UIButton) {
    guard let url=URL(string: "https://way.today/#\(waytoday.tid)!30m") else {
      return //be safe
    }
    if #available(iOS 10.0, *) {
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
    } else {
      UIApplication.shared.openURL(url)
    }
  }
  
  @IBAction func clickShareButton(_ sender: UIButton) {
    guard let url=URL(string: "https://way.today/#\(waytoday.tid)!30m") else {
      return //be safe
    }
    
    // set up activity view controller
    let textToShare = [ url ] as [Any]
    let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
    activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
    
    // exclude some activity types from the list (optional)
   activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.assignToContact, UIActivity.ActivityType.openInIBooks]
    
    // present the view controller
    self.present(activityViewController, animated: true, completion: nil)

  }
  
}

