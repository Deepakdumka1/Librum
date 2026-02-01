import Foundation

class MockDataProvider {
    
    static func getHomeSections() -> [HomeSection] {
        let books = [
            Book(id: "1", title: "Never Ending Sky", author: "Joseph Kirkland", coverImageName: "bookcard1", description: "Never Ending Sky is a brief, emotional story about self-discovery and hope, showing how people find strength and meaning even during difficult times.", genres: ["Drama", "Hope", "Inspirational"], themeColor: "#1A1A2E"),
            Book(id: "2", title: "Empire of Storms", author: "Sarah J. Maas", coverImageName: "bookcard2", description: "Only the greatest sacrifice can turn the tide of war. War is brewing in the fifth book in this complete series.", genres: ["Fantasy", "Romance", "Sci-Fi"], themeColor: "#8A4B8F"),
            Book(id: "3", title: "How Innovation Works", author: "Matt Ridley", coverImageName: "bookcard3", description: "How Innovation Works shows how new ideas grow through trial, error, and collaboration, shaping progress over time.", genres: ["Non-Fiction", "Business", "Tech"], themeColor: "#F7D748"),
            Book(id: "4", title: "Through The Breaking", author: "Cate Emond", coverImageName: "bookcard4", description: "Through the Breaking follows a young woman's journey through heartbreak and emotional struggle, leading to healing.", genres: ["Poetry", "Emotional", "Healing"], themeColor: "#E8B4B8")
        ]
        
        let users = [
            User(id: "1", name: "Aisha", username: "aisha_books23", avatarImageName: "suggestedprofile1"),
            User(id: "2", name: "John", username: "john_reads", avatarImageName: "suggestedprofile2"),
            User(id: "3", name: "Sara", username: "sara_lit", avatarImageName: "suggestedprofile3")
        ]
        
        let jessika = User(id: "u1", name: "Jessika Sanford", username: "jessika", avatarImageName: "suggestedprofile4")
        let kylie = User(id: "u2", name: "Kylie📖🩷", username: "kylie", avatarImageName: "suggestedprofile5")
        let leena = User(id: "u3", name: "Leena", username: "leena", avatarImageName: "suggestedprofile6")
        let aisha = User(id: "u4", name: "Aisha 🥗", username: "aisha", avatarImageName: "suggestedprofile1")
        
        let cookbook = Book(id: "b1", title: "Cherry Bombe: The Cookbook", author: "", coverImageName: "image", description: nil, genres: ["Food", "Cooking"], themeColor: "#D4A373")
        
        let commentsP1 = [
            Comment(id: "c1", author: kylie, timestamp: "8h", content: "I've tried! It's harder than it looks 😅"),
            Comment(id: "c2", author: leena, timestamp: "5h", content: "Good luck! You can do it!"),
            Comment(id: "c3", author: aisha, timestamp: "2h", content: "I recommend starting with shorter books first.")
        ]
        
        let commentsP2 = [
            Comment(id: "c4", author: jessika, timestamp: "18h", content: "Kafka is always a trip. Definitely symbolic!"),
            Comment(id: "c5", author: aisha, timestamp: "12h", content: "I think it's about the burden of family expectations.")
        ]
        
        return [
            .trendingBooks(books),
            .post(Post(id: "p1", author: jessika, timestamp: "10h", subtitle: "Shared a post", content: "Has anyone ever tried to keep track of all the books they've ever read, or perhaps attempted to read 1000 books in a short amount of time, because I want to go on a mission to read as much as I can, even though I already tried 1000 books in a year and failed 😅, and I'm curious who else has tried this before.", imageName: nil, likesCount: 36, commentsCount: 9, type: .textOnly, referencedBook: nil, isLiked: false, comments: commentsP1)),
            .post(Post(id: "p2", author: kylie, timestamp: "20h", subtitle: "Posted about a book", content: "I just finished The Metamorphosis by Kafka and feel honestly confused and disturbed, and I'm wondering whether Gregor turning into an insect is meant to be taken literally or purely symbolically, and what the story personally meant to you.", imageName: "bookimage", likesCount: 24, commentsCount: 5, type: .withImage, referencedBook: cookbook, isLiked: true, comments: commentsP2)),
            .suggestedUsers(users),
            .post(Post(id: "p3", author: leena, timestamp: "12h", subtitle: "Shared a post", content: "In need of some romance recs!!! I'm happy with any tropes! Just figured I have soo many fantasy books and feeling like i need some light, easy, fun romance sprinkled in 💗", imageName: nil, likesCount: 4, commentsCount: 1, type: .textOnly, referencedBook: nil, isLiked: false, comments: [])),
            .post(Post(id: "p4", author: aisha, timestamp: "2h", subtitle: "Shared a post", content: "Just finished reading this masterpiece. The minimalist design philosophy really speaks to the essence of modern aesthetics.", imageName: nil, likesCount: 36, commentsCount: 9, type: .textOnly, referencedBook: nil, isLiked: false, comments: []))
        ]
    }
}
