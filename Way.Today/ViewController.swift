//
//  ViewController.swift
//  Way.Today
//
//  Created by Sergey Dolin on 06/07/2019.
//  Copyright © 2019 S4Y Solutions. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var waytoday: WayTodayState

  init(waytoday: WayTodayState, locationService: LocationService) {
    self.waytoday = waytoday
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    waytoday = WayTodayStateDefault.shared
    super.init(coder: aDecoder)
  }

  @IBOutlet var buttonOnOff: UIButton!

  var onImage: UIImage?
  var offImage: UIImage?

  override func viewDidLoad() {
    super.viewDidLoad()
    offImage = UIImage(named: "off")
    onImage = UIImage(named: "on")
    setButtonOnOffBackgroundImage()
  }

  @IBAction func clickOnOff(_ sender: UIButton) {
    waytoday.on = !waytoday.on
    setButtonOnOffBackgroundImage()
  }

  private func setButtonOnOffBackgroundImage() {
    if waytoday.on {
      buttonOnOff.setImage(self.onImage, for: UIControl.State.normal)
    }else{
      buttonOnOff.setImage(self.offImage, for: UIControl.State.normal)
    }
  }

}

