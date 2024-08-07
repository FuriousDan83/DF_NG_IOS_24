import Foundation

public protocol Book: Codable {
    
    //Note: Books published prior to 1 January 2007 have a 10 digit ISBN. Newer books have a 13 digit ISBN.
    var isbn10: String { get }
    var isbn13: String { get }
    
    var title_short: String { get }
    
    var coverImageURL: URL { get }
}
