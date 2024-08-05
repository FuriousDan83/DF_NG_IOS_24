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
    
    public func fetchBookList() async {
        do {
            bookList = try await getBookListUseCase.execute(query: "Animal Farm")
                .map(BookItem.init)
        } catch {
            //TODO Error handling
        }
    }
    
    public func fetchData(isRefreshing: Bool = false) async {
        if(!isRefreshing) {
            isFetchingData = true
        }
        
        await withTaskGroup(of: Void.self) { taskGroup in
            taskGroup.addTask {
                await self.fetchBookList()
            }
        }
        
        isFetchingData = false
    }
}
