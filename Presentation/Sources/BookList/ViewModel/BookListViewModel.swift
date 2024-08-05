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
    private let showBookDetailUseCase: ShowBookDetailUseCaseProtocol
    
    @Published public private(set) var bookList: [Book] = []
    @Published public private(set) var isFetchingData = false
    
    public init(getBookListUseCase: GetBookListUseCaseProtocol) {
        self.getBookListUseCase = getBookListUseCase
    }
    
    public func fetchBookList() async {
        do {
            bookList = try await getBookListUseCase.execute()
                .map(Book)
        } catch {
            //TODO Error handling
        }
    }
}
