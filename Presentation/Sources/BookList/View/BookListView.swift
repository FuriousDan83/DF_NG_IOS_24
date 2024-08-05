

import UseCaseProtocol
import AppStyle
import SwiftUI


private typealias Section = AppStyle.Section

public struct BookListView: View {
    
    @ObservedObject private var viewModel: BookListViewModel
    @State private var showingSpinner = false
    
    public var body: some View {
        List {
            searchSection
            
            bookCarouselSection
                .renderIf(!viewModel.bookList.isEmpty)
        }
        .listStyle(.plain)
        .background(Color.gray)
        .safeAreaInset(edge: .top, spacing: 0.0, content: {
                EmptyView()
                .frame(height: 1.0)
                .background(Color.green)
        })
        .spinner(isPresented: $showingSpinner)
        .task {
            await viewModel.fetchData()
        }
        .refreshable {
            await viewModel.fetchData(isRefreshing: true)
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
            Text("Home")
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
