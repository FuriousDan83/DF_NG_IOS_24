//
//  AppCoordinator.swift
//  BookHub
//
//  Created by Daniel Fourie on 05/08/2024.
//

import Combine
import BookList
import BookDetail
import SwiftUI

final class AppCoordinator: ObservableObject {
    
    @Published var bookListState: BookListState = .init()
    @Published var bookDetailState: BookDetailState?
    
    init() {
        let bookDetailStatePublisher = $bookListState
            .flatMap(\.$didSelectBook)
            .compactMap { $0 }
            .map { Just(BookDetailState(isbn: $0)) }
            .assertNoFailure()
            .switchToLatest()
            .share()
        
        bookDetailStatePublisher
            .map(Optional.some)
            .assign(to:&$bookDetailState)
        
        bookDetailStatePublisher
            .flatMap(\.$didSelectBack)
            .filter { $0 }
            .map { _ in nil }
            .assign(to: &$bookDetailState)
    }
}
