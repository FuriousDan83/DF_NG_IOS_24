//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import DomainTestUtilities
import AppStyle
import SwiftUI

private typealias Section = AppStyle.Section

public struct BookDetailView: View {
    
    @EnvironmentObject var bookDetailState: BookDetailState
    
    @ObservedObject private var viewModel: BookDetailViewModel
    @State private var showingSpinner = false
    
    public var body: some View {
        List {
            
        }
        .listStyle(.plain)
        .navigationBarBackButtonHidden()
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.startLocation.x < 20.0 && value.translation.width > 50.0 {
                        bookDetailState.didSelectBack = true
                    }
                }
        )
        .safeAreaInset(edge: .bottom, content: {
            List {
                
            }
        })
        .spinner(isPresented: $showingSpinner)
        .task {
            await viewModel.fetchData(isbn10: bookDetailState.isbn, isbn13: bookDetailState.isbn)
        }
        .onReceive(viewModel.$isFetchingData) {
            showingSpinner = $0
        }
        .refreshable {
            await viewModel.fetchData(isbn10: bookDetailState.isbn, isbn13: bookDetailState.isbn, isRefreshing: true)
        }
    }
    
    public init(viewModel: BookDetailViewModel) {
        self.viewModel = viewModel
    }
}

private extension BookDetailView {
    var footerView: some View {
        HStack(alignment: .center, spacing: 24.0) {
            
        }
        .padding(16.0)
    }
}

#if DEBUG
import UseCaseProtocol

struct BookDetail_Previews: PreviewProvider {
    
    static var previews: some View {
        let bookDetailViewModel = BookDetailViewModel(showBookDetailUseCase: MockShowBookDetailUseCaseProtocol())
        
        Group {
            BookDetailView(viewModel: bookDetailViewModel)
        }
    }
}
#endif
