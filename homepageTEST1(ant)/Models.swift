import UIKit

enum PostType {
    case textOnly
    case withImage
}

struct User {
    let id: String
    let name: String
    let username: String
    let avatarImageName: String?
}

struct Book {
    let id: String
    let title: String
    let author: String
    let coverImageName: String?
    let description: String?
    let genres: [String]
    let themeColor: String? // Hex color string
}

extension UIColor {
    convenience init?(hex: String) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if cString.hasPrefix("#") { cString.remove(at: cString.startIndex) }
        if cString.count != 6 { return nil }
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}


struct Post {
    let id: String
    let author: User
    let timestamp: String
    let subtitle: String // e.g., "Shared a post"
    let content: String
    let imageName: String?
    var likesCount: Int
    var commentsCount: Int
    let type: PostType
    let referencedBook: Book? // For Posts that reference a book
    var isLiked: Bool = false
    var comments: [Comment] = []
}

struct Comment {
    let id: String
    let author: User
    let timestamp: String
    let content: String
}

extension UIFont {
    static func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            return UIFont(descriptor: descriptor, size: size)
        }
        return systemFont
    }
}

enum HomeSection {
    case trendingBooks([Book])
    case post(Post)
    case suggestedUsers([User])
}
