//
//  ContainersGridView.swift
//  Harbour
//
//  Created by royal on 23/07/2022.
//

import SwiftUI
import PortainerKit

// MARK: - ContainersGridView

struct ContainersGridView: View {
	@EnvironmentObject private var sceneDelegate: SceneDelegate
	@Environment(\.horizontalSizeClass) private var horizontalSizeClass: UserInterfaceSizeClass?
	@Environment(\.portainerSelectedEndpointID) private var portainerSelectedEndpointID: Endpoint.ID?

	private let cellMinimumSize: Double = 100
	private let cellSpacing: Double = 8

	let containers: [Container]

	var body: some View {
		LazyVGrid(columns: [.init(.adaptive(minimum: cellMinimumSize, maximum: .infinity))], spacing: cellSpacing) {
			ForEach(containers) { container in
				ContainersView.ContainerNavigationCell(container: container) {
					ContainerCell(container: container)
						.equatable()
				}
				.transition(.opacity)
			}
		}
	}
}

// MARK: - Previews

struct ContainersGridView_Previews: PreviewProvider {
	static var previews: some View {
		ContainersGridView(containers: [])
	}
}
