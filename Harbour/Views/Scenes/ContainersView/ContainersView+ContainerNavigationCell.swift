//
//  ContainersView+ContainerNavigationCell.swift
//  Harbour
//
//  Created by royal on 16/10/2022.
//

import SwiftUI
import PortainerKit

extension ContainersView {
	struct ContainerNavigationCell<Content: View>: View {
		@Environment(\.portainerServerURL) private var portainerServerURL: URL?
		@Environment(\.portainerSelectedEndpointID) private var portainerSelectedEndpointID: Endpoint.ID?
		let container: Container
		let content: () -> Content

		private var navigationItem: ContainerNavigationItem {
			let containerID = container.id
			let displayName = container.displayName
			let endpointID = portainerSelectedEndpointID
			return .init(id: containerID, displayName: displayName, endpointID: endpointID)
		}

		var body: some View {
			NavigationLink(value: navigationItem) {
				content()
					.contextMenu {
						ContainerContextMenu(container: container)
					}
					.tint(Color.primary)
			}
		}
	}
}
