import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var sections: [HomeSection] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        loadMockData()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        let header = HomeHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 180))
        header.delegate = self
        tableView.tableHeaderView = header
        
        // Register cells if not using Storyboard prototype cells
        tableView.register(TrendingBooksCell.self, forCellReuseIdentifier: TrendingBooksCell.identifier)
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.identifier)
        tableView.register(PostWithImageCell.self, forCellReuseIdentifier: PostWithImageCell.identifier)
        tableView.register(SuggestedUsersCell.self, forCellReuseIdentifier: SuggestedUsersCell.identifier)
    }
    
    private func loadMockData() {
        sections = MockDataProvider.getHomeSections()
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = sections[indexPath.section]
        
        switch section {
        case .trendingBooks(let books):
            let cell = tableView.dequeueReusableCell(withIdentifier: TrendingBooksCell.identifier, for: indexPath) as! TrendingBooksCell
            cell.configure(with: books)
            cell.delegate = self
            return cell
            
        case .post(let post):
            if post.type == .textOnly {
                let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.identifier, for: indexPath) as! PostCell
                cell.configure(with: post)
                cell.delegate = self
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: PostWithImageCell.identifier, for: indexPath) as! PostWithImageCell
                cell.configure(with: post)
                cell.delegate = self
                return cell
            }
            
        case .suggestedUsers(let users):
            let cell = tableView.dequeueReusableCell(withIdentifier: SuggestedUsersCell.identifier, for: indexPath) as! SuggestedUsersCell
            cell.configure(with: users)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension ViewController: PostCellDelegate {
    func postCellDidTapLike(_ cell: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let section = sections[indexPath.section]
        
        if case .post(var post) = section {
            post.isLiked.toggle()
            if post.isLiked {
                post.likesCount += 1
            } else {
                post.likesCount -= 1
            }
            sections[indexPath.section] = .post(post)
            tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
    
    func postCellDidTapComment(_ cell: UITableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else { return }
        let section = sections[indexPath.section]
        
        if case .post(let post) = section {
            let commentsVC = CommentsViewController()
            commentsVC.post = post
            if let sheet = commentsVC.sheetPresentationController {
                sheet.detents = [.medium(), .large()]
                sheet.prefersGrabberVisible = true
            }
            present(commentsVC, animated: true)
        }
    }
}

extension ViewController: HomeHeaderViewDelegate {
    func homeHeaderViewDidTapTrending(_ headerView: HomeHeaderView) {
        let trendingVC = TrendingBooksViewController()
        trendingVC.modalPresentationStyle = .fullScreen
        present(trendingVC, animated: true)
    }
}

extension ViewController: TrendingBooksCellDelegate {
    func trendingBooksCell(_ cell: TrendingBooksCell, didSelectBook book: Book) {
        let detailVC = BookDetailViewController()
        detailVC.book = book
        present(detailVC, animated: true)
    }
}
