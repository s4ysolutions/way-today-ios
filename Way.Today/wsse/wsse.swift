//
//  wsse.swift
//  Way.Today
//
//  Created by Sergey Dolin on 08/07/2019.
//  Copyright © 2019 S4Y Solutions. All rights reserved.
//

import Foundation
import CryptoSwift
import SwiftGRPC

class WSSE {
  static func digest() -> String {
    let created = Date().iso8601
    let nonce = "\(created)\(arc4random())"
    let nonce64 = nonce.bytes.sha1().toBase64() ?? ""
    let passwordDigest="\(nonce)\(created)\(GRPCSecret.secret)"
      .bytes
      .sha1()
      .toBase64() ?? ""
    return "Username=\"waytoday.ios\",PasswordDigest=\"\(passwordDigest)\",Nonce=\"\(nonce64)\",Created=\"\(created)\""
  }

  static func metadata() throws -> Metadata {
    let metadata = Metadata()
    try metadata.add(key: "x-wsse", value: digest())
    return metadata
  }
}

