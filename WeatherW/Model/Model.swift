//
//  Model.swift
//  WeatherW
//
//  Created by Sofi on 09.03.2021.
//

import Foundation
import SwiftUI


struct Model:Hashable {
    let temp, city, detailsWeather, wind, cloud, humidity, time:String
}



struct ModelThreeDays:Hashable {
    let temp, city, detailsWeather, wind, cloud, humidity, time:String
}
struct ModelThreeDaysID:Hashable {
    let id:String
}
