//
//  HomeView.swift
//  iosleaningappswiftui
//
//  Created by Dhruv on 14/12/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.items) { coworkingSpace in
                NavigationLink(destination: DetailView(coworkingSpace: coworkingSpace)) {
                    CoworkingSpaceRow(coworkingSpace: coworkingSpace)
                }
            }
            .navigationTitle("Coworking Spaces")
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

struct CoworkingSpaceRow: View {
    var coworkingSpace: CoworkingSpace

    var body: some View {
        VStack(alignment: .leading) {
            Text(coworkingSpace.organisation)
                .font(.headline)
            Text(coworkingSpace.address)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct DetailView: View {
    var coworkingSpace: CoworkingSpace

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Organisation: \(coworkingSpace.organisation)")
                    .font(.title)
                Text("Address: \(coworkingSpace.address)")
                    .font(.subheadline)
                Text("Website: \(coworkingSpace.website)")
                    .font(.subheadline)
                Text("Latitude: \(coworkingSpace.latitude)")
                    .font(.subheadline)
                Text("Longitude: \(coworkingSpace.longitude)")
                    .font(.subheadline)
            }.frame(maxWidth: .infinity, alignment: .leading)
        }.padding(.leading, 15).padding(.trailing, 15).frame(maxWidth: .infinity).navigationTitle("Detail")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
