//
//  JsonExtension.swift
//  ioslearningapp
//
//  Created by Dhruv on 13/12/2023.
//

import Foundation

extension String {
    func loadJsonData() -> String? {
            let url = Bundle.main.url(forResource: self, withExtension: "json")
        
        if (url == nil) {
            return nil
        }

            do {
                let jsonString = try String(contentsOf: url!, encoding: .utf8)
                return jsonString
            } catch let error as NSError {
                print("Failed to load \(self).json from the specified path. Error: \(error)")
                return nil
            }
        }

    func convertToModel<T: Decodable>() -> T? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }

        let decoder = JSONDecoder()

        do {
            let converted = try decoder.decode(T.self, from: data)
            return converted
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
