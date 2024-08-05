//
//  Container+Injection.swift
//  BookHub
//
//  Created by Daniel Fourie on 05/08/2024.
//

import Factory
import BookList
import BookDetail
import NetworkCore
import NetworkExtension
import Pilot
import Repositories
import RepositoryProtocol
import UseCases
import UseCaseProtocol

@MainActor
extension Container {
    
    static let bookAPI = Factory<BookAPIProtocol>(scope: .cached) { Pilot<BookRoute>() }
    
    static let bookListViewModel = Factory(scope: .cached) {
        BookListViewModel(getBookListUseCase: getBookListUseCase.callAsFunction() )
    }
    
    static let bookDetailViewModel = Factory(scope: .cached) {
        BookDetailViewModel(showBookDetailUseCase: showBookDetailUseCase.callAsFunction() )
    }
    
    static let bookRepository = Factory<BookRepositoryProtocol>(scope: .cached) {
        BookRepository(bookAPI: bookAPI.callAsFunction() )
    }
    
    static let getBookListUseCase = Factory<GetBookListUseCaseProtocol>(scope: .cached) {
        GetBookListUseCase(repository: bookRepository.callAsFunction())
    }
    
    static let showBookDetailUseCase = Factory<ShowBookDetailUseCaseProtocol>(scope: .cached) {
        ShowBookDetailUseCase(repository: bookRepository.callAsFunction())
    }
}
