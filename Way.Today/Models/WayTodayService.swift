//
//  WayTodayService.swift
//  Way.Today
//
//  Created by Sergey Dolin on 08/07/2019.
//  Copyright © 2019 S4Y Solutions. All rights reserved.
//

protocol WayTodayService {
  func ping(payload: String) throws
  func generateTid(prevTid: String, complete: @escaping (_ tid: String) -> Void) throws
}
