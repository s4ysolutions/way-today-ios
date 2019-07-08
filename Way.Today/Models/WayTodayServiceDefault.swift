//
//  WayTodayServiceDefault.swift
//  Way.Today
//
//  Created by Sergey Dolin on 08/07/2019.
//  Copyright © 2019 S4Y Solutions. All rights reserved.
//

import Foundation

class WayTodayServiceDefault: WayTodayService {
  private static var _shared: WayTodayService?
  static func shared(log: Log) -> WayTodayService{
    if (_shared == nil) {
      _shared = WayTodayServiceDefault(address: "tracker.way.today:9101", log: log)
    }
    return _shared!
  }

  private let client: Grpc_TrackerServiceClient
  private let log: Log

  init(address: String, log: Log){
    self.log = log
    client = Grpc_TrackerServiceClient(address: address, secure: true)
  }

  func ping(payload: String) throws {
    var request = Grpc_PingRequest()
    request.payload = payload
    try client.ping(request, completion: {(response, result) in
      // print(response?.payload)
    })
  }

  func generateTid(prevTid: String, complete: @escaping (_ tid: String) -> Void) throws{
//    log.debug("WayTodayService issue generateTid, prevID=\"%s\"", _prevTid)
    log.debug("WayTodayService issue generateTid")
    var request = Grpc_GenerateTrackerIDRequest()
    request.prevTid = prevTid
    try client.generateTrackerID(request, completion: {(response, result) in
      let tid = response?.tid ?? ""
      complete(tid)
      self.log.debug("WayTodayService return generateTid")
/*
 self.log.debug(
        "WayTodayService return generateTid, prevID=\"%s\", tid=\"%s\"",
        prevTid as NSString,
        tid as NSString
      )
 */
    })
  }
}
