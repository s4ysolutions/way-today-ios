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
  @IBOutlet var buttonSoundOnOff: UIButton!
  @IBOutlet var labelOff: UILabel!
  @IBOutlet var labelOn: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    setButtonOnOffImage()
    setButtonSoundOnOffImage()
    labelOn.isHidden = true
    labelOff.isHidden = true
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

}

