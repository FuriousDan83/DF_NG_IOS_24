//
//  ContentView.swift
//  BookHub
//
//  Created by Daniel Fourie on 03/08/2024.
//

import SwiftUI
import BookList
import BookDetail
import Factory

struct AppView: View {
    
    @StateObject private var appCoordinator: AppCoordinator = .init()
    @State private var showingBookDetail = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BookListView(viewModel: Container.bookListViewModel())
                    .environmentObject(appCoordinator.bookListState)
                    
                
                NavigationLink("", isActive: $showingBookDetail) {
                    appCoordinator.bookDetailState.map {
                        BookDetailView(viewModel: Container.bookDetailViewModel())
                            .environmentObject($0)
                            .labelsHidden()
                    }
                }
            }
        }
        .onReceive(appCoordinator.$bookDetailState) {
            showingBookDetail = $0 != nil
        }
    }
    
}

#Preview {
    AppView()
}
