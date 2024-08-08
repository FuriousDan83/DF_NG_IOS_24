

import UseCaseProtocol
import AppStyle
import SwiftUI
import Lottie

private typealias Section = AppStyle.Section

public struct BookListView: View {
    
    @ObservedObject private var viewModel: BookListViewModel
    @State private var showingSpinner = false
    @State private var searchText = ""
    
    public var body: some View {
        ZStack {
            searchSection
            
            
        }
        .spinner(isPresented: $showingSpinner)
        .task {
            await viewModel.fetchData(query: searchText)
        }
        .refreshable {
            await viewModel.fetchData(query: searchText, isRefreshing: true)
        }
        .onReceive(viewModel.$isFetchingData) {
            showingSpinner = $0
        }
    }
    
    public init(viewModel: BookListViewModel) {
        self.viewModel = viewModel
    }
}

private extension BookListView {
    
    var searchSection: some View {
        Section {
            Text("Searching for \(searchText)")
                .searchable(text: $searchText, prompt: "Search for books...")
                .multilineTextAlignment(.center)
                .padding(.top, 24.0)
                .padding(.bottom, 40.0)
        }
    }
    
    var bookCarouselSection: some View {
        Section {
            Text("Book section thing")
        } header: {
            HStack {
                Text("Header text")
            }
        }
    }
    
    var lottieView: some View {
        Section {
            LottieView(animation: .named(AppStyle.Lottie.bookLottie))
        }
    }
}


#if DEBUG
import DomainTestUtilities

struct BookListView_Previews: PreviewProvider {
    
    static var previews: some View {
        let bookListViewModel = BookListViewModel(getBookListUseCase: MockGetBookListUseCaseProtocol())
        
        Group {
            BookListView(viewModel: bookListViewModel)
        }
    }
}

#endif
