import UIKit



struct LocationManager: LocationServiceProtocol {
    let locationData: LocationData
    
    
    func currentLocation() async -> Coordinates? {
        return (51.52, -0.11)
    }
    // cityName поменять
    func getLocation(name: String) async -> Coordinates? {
        let result = await withUnsafeContinuation{ continuation in
            performRequest(urlString: "\(url)&q=\(locationData.displayName)") { locationData in
                if locationData != nil{
                    continuation.resume(with: Result.success(locationData))
                } else {
                    continuation.resume(with: Result.failure(NSError() as! Never))
                }
            }
        }
        return result
    }
    
    
    var weatherService = WeatherService()

    var url = "https://geocode.maps.co/search?&api_key=658eceba168c9076314183bvmfc3f66"
    
    func getLocation(cityName: String) {
        let urlString = "\(url)&q=\(cityName)"
        print(urlString)
        performRequest(urlString: urlString) { locationData in
            print(locationData)

        }       
        performRequest(urlString: urlString) { locationData in
            print(locationData?.lat)
        }
    }
    
    func performRequest(urlString: String, callBack: (LocationData?) -> ()) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    
                    
                    callBack(nil)
                    
                    // Handle the error appropriately, e.g., notify the user or log the error.
                    return
                }
//                callBack()
                if let safeData = data {
                    callBack(parseJson(locationData: safeData))
                    
                }
            }
            
            task.resume()
        }
    }
    
    func parseJson(locationData: Data) -> LocationData?{
        let decoder = JSONDecoder()
        do {
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode([LocationData].self, from: locationData)
            return decodedData.first
                            
            
            
        } catch {
            print("Error decoding JSON: \(error)")
            return nil
            // Handle the error appropriately, e.g., notify the user or log the error.
        }
    }
    
    
}
