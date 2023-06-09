//
//  Indicator+ErrorInit.swift
//  Harbour
//
//  Created by royal on 29/09/2022.
//

import SwiftUI
import IndicatorsKit

extension Indicator {
	init(error: Error) {
		let style = Indicator.Style(headlineColor: Color.red, iconColor: Color.red)

		let subheadline: String
		let expandedText: String?
		if error.localizedDescription.count <= 16 {
			subheadline = error.localizedDescription
			expandedText = nil
		} else {
			subheadline = Localizable.Indicators.expandToReadMore
			expandedText = error.localizedDescription
		}

		self.init(id: String(describing: error).hashValue.description,
				  headline: Localizable.Indicators.error,
				  subheadline: subheadline,
				  expandedText: expandedText,
				  style: style)
	}
}
