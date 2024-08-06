//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import SwiftUI
import UseCaseProtocol

@MainActor public final class BookListViewModel: ObservableObject {
    
    private let getBookListUseCase: GetBookListUseCaseProtocol
    
    @Published public private(set) var bookList: [BookItem] = []
    @Published public private(set) var isFetchingData = false
    
    public init(getBookListUseCase: GetBookListUseCaseProtocol) {
        self.getBookListUseCase = getBookListUseCase
    }
    
    public func fetchBookList(query: String) async {
        do {
            bookList = try await getBookListUseCase.execute(query: query)
                .map(BookItem.init)
            
            for book in bookList {
                print("Book found -> \(book.title_short)")
            }
        } catch {
            //TODO Error handling
            print("ERROR --- \(error)")
        }
    }
    
    public func fetchData(query: String, isRefreshing: Bool = false) async {
        if(!isRefreshing) {
            isFetchingData = true
        }
        
        await withTaskGroup(of: Void.self) { taskGroup in
            taskGroup.addTask {
                await self.fetchBookList(query: query)
            }
        }
        
        isFetchingData = false
    }
}
