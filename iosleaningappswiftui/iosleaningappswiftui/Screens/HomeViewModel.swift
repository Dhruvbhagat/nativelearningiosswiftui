//
//  HomeViewModel.swift
//  ioslearningapp
//
//  Created by Dhruv on 13/12/2023.
//

import Foundation

class HomeViewModel : ObservableObject {
    private let apiService: ApiServiceProtocol

    @Published var items: [CoworkingSpace] = []

    init(apiService: ApiServiceProtocol = ApiService.shared) {
        self.apiService = apiService
    }

    func fetchData() {
        apiService.fetchData { result in
            switch result {
            case .success(let items):
                self.items = items
            case .failure:
                let jsonString = "coworkingSpaces".loadJsonData()
                let data: [CoworkingSpace]? = jsonString?.convertToModel()
                self.items = data!
            }
        }
    }
}
