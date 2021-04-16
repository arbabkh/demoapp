//
//  Utils.swift
//  DemoApp
//
//  Created by Arbab Ahmed Khan on 16/04/21.
//

import Foundation
class Utils: NSObject {
	
	class public func convertDateIntoUnixTimestamp(inDate: Date) -> String {
		let timeinterval = Int(inDate.timeIntervalSince1970)
		return "\(timeinterval)"
	}
	
	class public func convertUnixTimestampIntoDate(inString: String!) -> Date {
		guard let timeInterval = Double(inString) else { return Date.init() }
		let date = Date.init(timeIntervalSince1970:timeInterval)
		return date
	}
	
	class public func getRelativeMMMDDYYDate(inDate: Date) -> String {
		let formatSourceDate = DateFormatter()
		formatSourceDate.locale = Utils.customLocale()
		formatSourceDate.dateFormat = "MMM dd, yyyy"
		return formatSourceDate.string(from: inDate)
	}
	
	class public func getRelativeTime(inDate: Date, addAmPm: Bool) -> String {
		let formatSourceDate = DateFormatter()
		formatSourceDate.locale = Utils.customLocale()
		if addAmPm {
			formatSourceDate.amSymbol = "AM"
			formatSourceDate.pmSymbol = "PM"
			formatSourceDate.dateFormat = "h:mm a"
		} else {
			formatSourceDate.dateFormat = "h:mm"
		}
		return formatSourceDate.string(from: inDate)
	}
	
	class public func customLocale() -> Locale {
		let locale = Locale(identifier: "en_US_POSIX")
		return locale
	}

}
