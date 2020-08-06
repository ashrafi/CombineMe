// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let station = try? newJSONDecoder().decode(Station.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.stationTask(with: url) { station, response, error in
//     if let station = station {
//       ...
//     }
//   }
//   task.resume()

import Foundation

// MARK: - Station
struct Station: Codable, Identifiable {
    let id = UUID()
    let rentalUris: RentalUris
    let hasKiosk: Bool
    let rentalMethods: [RentalMethod]
    let lat: Double
    let electricBikeSurchargeWaiver: Bool
    let legacyID, shortName: String
    let lon: Double
    let eightdStationServices: [JSONAny]
    let regionID: String?
    let capacity: Int
    let stationID, externalID, name: String
    let eightdHasKeyDispenser: Bool
    let stationType: StationType

    enum CodingKeys: String, CodingKey {
        case rentalUris = "rental_uris"
        case hasKiosk = "has_kiosk"
        case rentalMethods = "rental_methods"
        case lat
        case electricBikeSurchargeWaiver = "electric_bike_surcharge_waiver"
        case legacyID = "legacy_id"
        case shortName = "short_name"
        case lon
        case eightdStationServices = "eightd_station_services"
        case regionID = "region_id"
        case capacity
        case stationID = "station_id"
        case externalID = "external_id"
        case name
        case eightdHasKeyDispenser = "eightd_has_key_dispenser"
        case stationType = "station_type"
    }
}
