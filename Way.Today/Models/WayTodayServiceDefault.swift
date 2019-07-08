//
//  WayTodayServiceDefault.swift
//  Way.Today
//
//  Created by Sergey Dolin on 08/07/2019.
//  Copyright © 2019 S4Y Solutions. All rights reserved.
//

class WayTodayServiceDefault: WayTodayService {
  static let shared = WayTodayServiceDefault(address: "tracker.way.today:9101")

  let client: Grpc_TrackerServiceClient

  init(address: String){
    client = Grpc_TrackerServiceClient(address: address, secure: true)
  }

  func ping(payload: String){
    var request = Grpc_PingRequest()
    request.payload = payload
    do {
    try client.ping(request, completion: {(response, call) in
      print(response?.payload)
    })
    }catch{
      print(error)
    }
  }
}
