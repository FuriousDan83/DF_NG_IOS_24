//
//  File.swift
//  
//
//  Created by Daniel Fourie on 05/08/2024.
//

import Foundation
import UseCaseProtocol

@MainActor public final class BookDetailViewModel: ObservableObject {
    
    private let bookDetailUseCase: ShowBookDetailUseCaseProtocol
    
    @Published public private(set) var showBookDetail: BookDetailItem?
    @Published public private(set) var isSuccess = false
    @Published public private(set) var isFetchingData = false
    
    public init(
        showBookDetailUseCase: ShowBookDetailUseCaseProtocol
    ) {
        self.bookDetailUseCase = showBookDetailUseCase
    }
    
    public func fetchBookDetail(isbn10: String, isbn13: String) async {
        do {
            let book = try await bookDetailUseCase.execute(isbn10: isbn10, isbn13: isbn13)
            showBookDetail = BookDetailItem(bookDetail: book)
        } catch {
            
        }
    }
    
    public func fetchData(isbn10: String, isbn13: String, isRefreshing: Bool = false) async {
        if !isRefreshing {
            isFetchingData = true
        }
        
        await withTaskGroup(of: Void.self) { taskGroup in
            taskGroup.addTask { await self.fetchBookDetail(isbn10: isbn10, isbn13: isbn13)}
        }
        
        isFetchingData = false
    }
}
