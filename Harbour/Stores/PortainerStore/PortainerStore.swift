//
//  PortainerStore.swift
//  Harbour
//
//  Created by royal on 23/07/2022.
//

import Foundation
import os.log
import PortainerKit

final class PortainerStore: ObservableObject {
	static let shared: PortainerStore = PortainerStore()

	// swiftlint:disable:next force_unwrapping
	internal let logger: Logger = Logger(subsystem: Bundle.main.bundleIdentifier!, category: "PortainerStore")

	@Published private(set) var endpoints: [Endpoint] = []

	private init() {

	}
}