//
//  HealthConfig.swift
//  PortainerKit
//
//  Created by royal on 17/07/2022.
//

public struct HealthConfig: Decodable, Sendable {
	enum CodingKeys: String, CodingKey {
		case test = "Test"
		case interval = "Interval"
		case timeout = "Timeout"
		case retries = "Retries"
		case startPeriod = "StartPeriod"
	}

	public let test: [String]
	public let interval: Int
	public let timeout: Int
	public let retries: Int
	public let startPeriod: Int
}
