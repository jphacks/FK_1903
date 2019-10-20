//
// SneakerRanking.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation



public struct SneakerRanking: Codable {

    public var _id: Int64
    public var sneakerNum: Int
    public var sneakers: [SneakerDetail]

    public init(_id: Int64, sneakerNum: Int, sneakers: [SneakerDetail]) {
        self._id = _id
        self.sneakerNum = sneakerNum
        self.sneakers = sneakers
    }

    public enum CodingKeys: String, CodingKey { 
        case _id = "id"
        case sneakerNum
        case sneakers
    }


}

