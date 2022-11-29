//
//  TicketDate.swift
//  MovieApp
//
//  Created by Oscar Martinez on 11/24/22.
//

import Foundation

struct TicketDate: Equatable {
    var day: String
    var month: String
    var year: String
    static var `default`: TicketDate { TicketDate(day: "", month: "", year: "")
    }
}
