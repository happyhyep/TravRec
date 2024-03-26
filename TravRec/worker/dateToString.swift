//
//  dateToString.swift
//  TravRec
//
//  Created by jeong hyein on 3/26/24.
//

import SwiftUI

func dateToString(date:Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy.MM.dd"
    let dateString = dateFormatter.string(from: date)
    return dateString
}
