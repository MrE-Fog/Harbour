//
//  ContainersListView+ContainerCell.swift
//  Harbour
//
//  Created by royal on 29/09/2022.
//

import SwiftUI
import PortainerKit

// MARK: - ContainersListView+ContainerCell

extension ContainersListView {
	struct ContainerCell: View {
		private typealias Localization = Localizable.ContainerCell

		private let roundedRectangle = RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .circular)
		private let minimumScaleFactor: Double = 0.8

		let container: Container

		@ViewBuilder
		private var headlineLabel: some View {
			Text(container.displayName ?? Localization.unnamed)
				.font(.headline.weight(.semibold))
				.foregroundStyle(container.displayName != nil ? .primary : .secondary)
				.transition(.opacity)
				.animation(.easeInOut, value: container.displayName)
		}

		@ViewBuilder
		private var subheadlineLabel: some View {
			HStack(spacing: 0) {
				Text(container.isStored ? ContainerState?.none.description : container.state.description.localizedCapitalized)
					.foregroundColor(container.isStored ? ContainerState?.none.color : container.state.color)
					.transition(.opacity)
					.animation(.easeInOut, value: container.state)
					.animation(.easeInOut, value: container.isStored)

				if let containerStatus = container.status {
					Group {
						Text(Localization.stateJoiner)
						Text(containerStatus)
					}
					.foregroundStyle(.secondary)
				}
			}
			.font(.subheadline.weight(.medium))
			.transition(.opacity)
			.animation(.easeInOut, value: container.status)
		}

		var body: some View {
			HStack {
				VStack(alignment: .leading, spacing: 2) {
					headlineLabel
					subheadlineLabel
				}
				.lineLimit(2)
				.multilineTextAlignment(.leading)
				.minimumScaleFactor(minimumScaleFactor)

				Spacer()

				Circle()
					.fill(container.isStored ? ContainerState?.none.color : container.state.color)
					.frame(width: Constants.ContainerCell.circleSize, height: Constants.ContainerCell.circleSize)
					.transition(.opacity)
					.animation(.easeInOut, value: container.state)
			}
			.padding()
			.frame(maxWidth: .infinity)
			.background(Color(uiColor: .secondarySystemGroupedBackground))
			.clipShape(roundedRectangle)
			.contentShape(roundedRectangle)
		}
	}
}

// MARK: - ContainersListView.ContainerCell+Identifiable

extension ContainersListView.ContainerCell: Identifiable {
	var id: String { container.id }
}

// MARK: - ContainersListView.ContainerCell+Equatable

extension ContainersListView.ContainerCell: Equatable {
	static func == (lhs: ContainersListView.ContainerCell, rhs: ContainersListView.ContainerCell) -> Bool {
		lhs.container.state == rhs.container.state &&
		lhs.container.status == rhs.container.status &&
		lhs.container.displayName == rhs.container.displayName &&
		lhs.container.id == rhs.container.id
	}
}

// MARK: - Previews

struct ContainersListView_ContainerCell_Previews: PreviewProvider {
	static let container = Container(id: "id", names: ["PreviewContainer"], state: .running, status: "Status")
	static var previews: some View {
		ContainersListView.ContainerCell(container: container)
			.padding()
			.background(Color(uiColor: .systemGroupedBackground))
			.previewLayout(.sizeThatFits)
	}
}
