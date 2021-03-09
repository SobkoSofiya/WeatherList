//
//  ViewModel.swift
//  WeatherW
//
//  Created by Sofi on 09.03.2021.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON


class ViewModel: ObservableObject {
    @Published var model:[Model] = []
    @Published var modelThreeDays:[ModelThreeDays] = []
    @Published var modelThreeDaysID:[ModelThreeDaysID] = []
    
    func getWeather() {
        let url = "http://api.weatherapi.com/v1/forecast.json?key=34de8e48d0944de6a83131619202610&q=London&days=3&aqi=no&alerts=no"
        AF.request(url, method: .get).validate().responseJSON { [self]response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                model.append(Model(temp: json["current"]["temp_c"].stringValue, city: json["location"]["name"].stringValue, detailsWeather: json["current"]["condition"]["text"].stringValue, wind: json["current"]["wind_kph"].stringValue, cloud: json["current"]["cloud"].stringValue, humidity: json["current"]["humidity"].stringValue, time: json["location"]["localtime"].stringValue))
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
    func getWeatherThreeDays() {
        let url = "http://api.weatherapi.com/v1/forecast.json?key=34de8e48d0944de6a83131619202610&q=London&days=3&aqi=no&alerts=no"
        AF.request(url, method: .get).validate().responseJSON { [self]response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let days = json["forecast"]["forecastday"].arrayValue
                for day in days{
                    let hours = day["hour"].arrayValue
                    modelThreeDaysID.append(ModelThreeDaysID(id: day["date"].stringValue))
                    
                    for hour in hours{
                        modelThreeDays.append(ModelThreeDays(temp: hour["temp_c"].stringValue, city: hour["temp_c"].stringValue, detailsWeather: hour["condition"]["text"].stringValue, wind: hour["wind_kph"].stringValue, cloud: hour["cloud"].stringValue, humidity: hour["temp_c"].stringValue, time: hour["time"].stringValue))
                    }
                }
                print("JSON: \(json)")
                print(days.count)
            case .failure(let error):
                print(error)
            }
        }
    }
}
