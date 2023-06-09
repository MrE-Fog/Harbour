//
//  DebugView.swift
//  Harbour
//
//  Created by royal on 02/10/2022.
//

import SwiftUI
import OSLog
import WidgetKit
import CommonHaptics

// MARK: - DebugView

struct DebugView: View {
	private typealias Localization = Localizable.Debug

	var body: some View {
		List {
			#if DEBUG
			LastBackgroundRefreshSection()
			#endif
			WidgetsSection()
			PersistenceSection()
			LogsSection()
		}
		.navigationTitle(Localization.title)
	}
}

// MARK: - DebugView+Components

private extension DebugView {
	#if DEBUG
	struct LastBackgroundRefreshSection: View {
		var body: some View {
			Section(content: {
				if let lastBackgroundRefreshDate = Preferences.shared.lastBackgroundRefreshDate {
					Text(Date(timeIntervalSince1970: lastBackgroundRefreshDate), format: .dateTime)
				} else {
					Text(Localization.LastBackgroundRefresh.never)
						.foregroundStyle(.secondary)
				}
			}, header: {
				Text(Localization.LastBackgroundRefresh.title)
			})
		}
	}
	#endif

	struct WidgetsSection: View {
		var body: some View {
			Section("WidgetKit") {
				Button("Refresh timelines") {
					Haptics.generateIfEnabled(.buttonPress)
					WidgetCenter.shared.reloadAllTimelines()
				}
			}
		}
	}

	struct PersistenceSection: View {
		var body: some View {
			Section("Persistence") {
				Button("Reset CoreData", role: .destructive) {
					Haptics.generateIfEnabled(.heavy)
					Persistence.shared.reset()
				}

				Button("Reset Keychain", role: .destructive) {
					Haptics.generateIfEnabled(.heavy)
					// TODO: Reset Keychain
				}
			}
		}
	}

	struct LogsSection: View {
		var body: some View {
			Section {
				NavigationLink("Logs") {
					LogsView()
				}
			}
		}
	}
}

// MARK: - Previews

struct DebugView_Previews: PreviewProvider {
	static var previews: some View {
		DebugView()
	}
}
