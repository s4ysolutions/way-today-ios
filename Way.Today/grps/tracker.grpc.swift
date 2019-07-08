//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: tracker.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import Dispatch
import Foundation
import SwiftGRPC
import SwiftProtobuf

internal protocol Grpc_TrackerPingCall: ClientCallUnary {}

fileprivate final class Grpc_TrackerPingCallBase: ClientCallUnaryBase<Grpc_PingRequest, Grpc_PongResponse>, Grpc_TrackerPingCall {
  override class var method: String { return "/grpc.Tracker/Ping" }
}

internal protocol Grpc_TrackerAddLocationsCall: ClientCallUnary {}

fileprivate final class Grpc_TrackerAddLocationsCallBase: ClientCallUnaryBase<Grpc_AddLocationsRequest, Grpc_AddLocationResponse>, Grpc_TrackerAddLocationsCall {
  override class var method: String { return "/grpc.Tracker/AddLocations" }
}

internal protocol Grpc_TrackerGetLocationsCall: ClientCallUnary {}

fileprivate final class Grpc_TrackerGetLocationsCallBase: ClientCallUnaryBase<Grpc_GetLocationsRequest, Models_Locations>, Grpc_TrackerGetLocationsCall {
  override class var method: String { return "/grpc.Tracker/GetLocations" }
}

internal protocol Grpc_TrackerGenerateTrackerIDCall: ClientCallUnary {}

fileprivate final class Grpc_TrackerGenerateTrackerIDCallBase: ClientCallUnaryBase<Grpc_GenerateTrackerIDRequest, Grpc_GenerateTrackerIDResponse>, Grpc_TrackerGenerateTrackerIDCall {
  override class var method: String { return "/grpc.Tracker/GenerateTrackerID" }
}

internal protocol Grpc_TrackerTestTrackerIDCall: ClientCallUnary {}

fileprivate final class Grpc_TrackerTestTrackerIDCallBase: ClientCallUnaryBase<Grpc_TestTrackerIDRequest, Grpc_TestTrackerIDResponse>, Grpc_TrackerTestTrackerIDCall {
  override class var method: String { return "/grpc.Tracker/TestTrackerID" }
}

internal protocol Grpc_TrackerFreeTrackerIDCall: ClientCallUnary {}

fileprivate final class Grpc_TrackerFreeTrackerIDCallBase: ClientCallUnaryBase<Grpc_FreeTrackerIDRequest, Grpc_FreeTrackerIDResponse>, Grpc_TrackerFreeTrackerIDCall {
  override class var method: String { return "/grpc.Tracker/FreeTrackerID" }
}


/// Instantiate Grpc_TrackerServiceClient, then call methods of this protocol to make API calls.
internal protocol Grpc_TrackerService: ServiceClient {
  /// Synchronous. Unary.
  func ping(_ request: Grpc_PingRequest, metadata customMetadata: Metadata) throws -> Grpc_PongResponse
  /// Asynchronous. Unary.
  @discardableResult
  func ping(_ request: Grpc_PingRequest, metadata customMetadata: Metadata, completion: @escaping (Grpc_PongResponse?, CallResult) -> Void) throws -> Grpc_TrackerPingCall

  /// Synchronous. Unary.
  func addLocations(_ request: Grpc_AddLocationsRequest, metadata customMetadata: Metadata) throws -> Grpc_AddLocationResponse
  /// Asynchronous. Unary.
  @discardableResult
  func addLocations(_ request: Grpc_AddLocationsRequest, metadata customMetadata: Metadata, completion: @escaping (Grpc_AddLocationResponse?, CallResult) -> Void) throws -> Grpc_TrackerAddLocationsCall

  /// Synchronous. Unary.
  func getLocations(_ request: Grpc_GetLocationsRequest, metadata customMetadata: Metadata) throws -> Models_Locations
  /// Asynchronous. Unary.
  @discardableResult
  func getLocations(_ request: Grpc_GetLocationsRequest, metadata customMetadata: Metadata, completion: @escaping (Models_Locations?, CallResult) -> Void) throws -> Grpc_TrackerGetLocationsCall

  /// Synchronous. Unary.
  func generateTrackerID(_ request: Grpc_GenerateTrackerIDRequest, metadata customMetadata: Metadata) throws -> Grpc_GenerateTrackerIDResponse
  /// Asynchronous. Unary.
  @discardableResult
  func generateTrackerID(_ request: Grpc_GenerateTrackerIDRequest, metadata customMetadata: Metadata, completion: @escaping (Grpc_GenerateTrackerIDResponse?, CallResult) -> Void) throws -> Grpc_TrackerGenerateTrackerIDCall

  /// Synchronous. Unary.
  func testTrackerID(_ request: Grpc_TestTrackerIDRequest, metadata customMetadata: Metadata) throws -> Grpc_TestTrackerIDResponse
  /// Asynchronous. Unary.
  @discardableResult
  func testTrackerID(_ request: Grpc_TestTrackerIDRequest, metadata customMetadata: Metadata, completion: @escaping (Grpc_TestTrackerIDResponse?, CallResult) -> Void) throws -> Grpc_TrackerTestTrackerIDCall

  /// Synchronous. Unary.
  func freeTrackerID(_ request: Grpc_FreeTrackerIDRequest, metadata customMetadata: Metadata) throws -> Grpc_FreeTrackerIDResponse
  /// Asynchronous. Unary.
  @discardableResult
  func freeTrackerID(_ request: Grpc_FreeTrackerIDRequest, metadata customMetadata: Metadata, completion: @escaping (Grpc_FreeTrackerIDResponse?, CallResult) -> Void) throws -> Grpc_TrackerFreeTrackerIDCall

}

internal extension Grpc_TrackerService {
  /// Synchronous. Unary.
  func ping(_ request: Grpc_PingRequest) throws -> Grpc_PongResponse {
    return try self.ping(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func ping(_ request: Grpc_PingRequest, completion: @escaping (Grpc_PongResponse?, CallResult) -> Void) throws -> Grpc_TrackerPingCall {
    return try self.ping(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func addLocations(_ request: Grpc_AddLocationsRequest) throws -> Grpc_AddLocationResponse {
    return try self.addLocations(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func addLocations(_ request: Grpc_AddLocationsRequest, completion: @escaping (Grpc_AddLocationResponse?, CallResult) -> Void) throws -> Grpc_TrackerAddLocationsCall {
    return try self.addLocations(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func getLocations(_ request: Grpc_GetLocationsRequest) throws -> Models_Locations {
    return try self.getLocations(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func getLocations(_ request: Grpc_GetLocationsRequest, completion: @escaping (Models_Locations?, CallResult) -> Void) throws -> Grpc_TrackerGetLocationsCall {
    return try self.getLocations(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func generateTrackerID(_ request: Grpc_GenerateTrackerIDRequest) throws -> Grpc_GenerateTrackerIDResponse {
    return try self.generateTrackerID(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func generateTrackerID(_ request: Grpc_GenerateTrackerIDRequest, completion: @escaping (Grpc_GenerateTrackerIDResponse?, CallResult) -> Void) throws -> Grpc_TrackerGenerateTrackerIDCall {
    return try self.generateTrackerID(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func testTrackerID(_ request: Grpc_TestTrackerIDRequest) throws -> Grpc_TestTrackerIDResponse {
    return try self.testTrackerID(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func testTrackerID(_ request: Grpc_TestTrackerIDRequest, completion: @escaping (Grpc_TestTrackerIDResponse?, CallResult) -> Void) throws -> Grpc_TrackerTestTrackerIDCall {
    return try self.testTrackerID(request, metadata: self.metadata, completion: completion)
  }

  /// Synchronous. Unary.
  func freeTrackerID(_ request: Grpc_FreeTrackerIDRequest) throws -> Grpc_FreeTrackerIDResponse {
    return try self.freeTrackerID(request, metadata: self.metadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  func freeTrackerID(_ request: Grpc_FreeTrackerIDRequest, completion: @escaping (Grpc_FreeTrackerIDResponse?, CallResult) -> Void) throws -> Grpc_TrackerFreeTrackerIDCall {
    return try self.freeTrackerID(request, metadata: self.metadata, completion: completion)
  }

}

internal final class Grpc_TrackerServiceClient: ServiceClientBase, Grpc_TrackerService {
  /// Synchronous. Unary.
  internal func ping(_ request: Grpc_PingRequest, metadata customMetadata: Metadata) throws -> Grpc_PongResponse {
    return try Grpc_TrackerPingCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func ping(_ request: Grpc_PingRequest, metadata customMetadata: Metadata, completion: @escaping (Grpc_PongResponse?, CallResult) -> Void) throws -> Grpc_TrackerPingCall {
    return try Grpc_TrackerPingCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func addLocations(_ request: Grpc_AddLocationsRequest, metadata customMetadata: Metadata) throws -> Grpc_AddLocationResponse {
    return try Grpc_TrackerAddLocationsCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func addLocations(_ request: Grpc_AddLocationsRequest, metadata customMetadata: Metadata, completion: @escaping (Grpc_AddLocationResponse?, CallResult) -> Void) throws -> Grpc_TrackerAddLocationsCall {
    return try Grpc_TrackerAddLocationsCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func getLocations(_ request: Grpc_GetLocationsRequest, metadata customMetadata: Metadata) throws -> Models_Locations {
    return try Grpc_TrackerGetLocationsCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func getLocations(_ request: Grpc_GetLocationsRequest, metadata customMetadata: Metadata, completion: @escaping (Models_Locations?, CallResult) -> Void) throws -> Grpc_TrackerGetLocationsCall {
    return try Grpc_TrackerGetLocationsCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func generateTrackerID(_ request: Grpc_GenerateTrackerIDRequest, metadata customMetadata: Metadata) throws -> Grpc_GenerateTrackerIDResponse {
    return try Grpc_TrackerGenerateTrackerIDCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func generateTrackerID(_ request: Grpc_GenerateTrackerIDRequest, metadata customMetadata: Metadata, completion: @escaping (Grpc_GenerateTrackerIDResponse?, CallResult) -> Void) throws -> Grpc_TrackerGenerateTrackerIDCall {
    return try Grpc_TrackerGenerateTrackerIDCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func testTrackerID(_ request: Grpc_TestTrackerIDRequest, metadata customMetadata: Metadata) throws -> Grpc_TestTrackerIDResponse {
    return try Grpc_TrackerTestTrackerIDCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func testTrackerID(_ request: Grpc_TestTrackerIDRequest, metadata customMetadata: Metadata, completion: @escaping (Grpc_TestTrackerIDResponse?, CallResult) -> Void) throws -> Grpc_TrackerTestTrackerIDCall {
    return try Grpc_TrackerTestTrackerIDCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

  /// Synchronous. Unary.
  internal func freeTrackerID(_ request: Grpc_FreeTrackerIDRequest, metadata customMetadata: Metadata) throws -> Grpc_FreeTrackerIDResponse {
    return try Grpc_TrackerFreeTrackerIDCallBase(channel)
      .run(request: request, metadata: customMetadata)
  }
  /// Asynchronous. Unary.
  @discardableResult
  internal func freeTrackerID(_ request: Grpc_FreeTrackerIDRequest, metadata customMetadata: Metadata, completion: @escaping (Grpc_FreeTrackerIDResponse?, CallResult) -> Void) throws -> Grpc_TrackerFreeTrackerIDCall {
    return try Grpc_TrackerFreeTrackerIDCallBase(channel)
      .start(request: request, metadata: customMetadata, completion: completion)
  }

}

