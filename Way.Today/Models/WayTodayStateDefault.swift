//
//  State.swift
//  Way.Today
//
//  Created by Sergey Dolin on 06/07/2019.
//  Copyright © 2019 S4Y Solutions. All rights reserved.
//

import Rasat
import UIKit

class WayTodayStateDefault: WayTodayState {
  static let _shared = WayTodayStateDefault()
  static var shared: WayTodayState {
    get { return _shared}
  }

  private let _subjectOn = Subject<Bool>(UserDefaults.standard.bool(forKey: "on"))
  var observableOn: Observable<Bool> {
    get {
      return _subjectOn.observable
    }
  }

  var on: Bool {
    get {
      return _subjectOn.value
    }
    set(on) {
      UserDefaults.standard.set(on, forKey: "on")
      _subjectOn.value=on
    }
  }

  var soundOn: Bool {
    get {
      return UserDefaults.standard.bool(forKey: "sndon")
    }
    set(on) {
      UserDefaults.standard.set(on, forKey: "sndon")
    }
  }

  var tid: String {
    get {
      return UserDefaults.standard.string(forKey: "tid") ?? ""
    }

    set(on) {
      UserDefaults.standard.set(on, forKey: "tid")
    }
  }


}
