//
//  DateExtension.swift
//  VConnect
//
//  Created by Donkemezuo Raymond Tariladou on 3/11/19.
//  Copyright © 2019 EnProTech Group. All rights reserved.
//

import Foundation
extension Date {
    // get an ISO timestamp
    static func getISOTimestamp() -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        let timestamp = isoDateFormatter.string(from: Date())
        return timestamp
    }
}
