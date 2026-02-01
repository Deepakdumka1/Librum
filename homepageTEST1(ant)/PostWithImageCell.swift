import UIKit

class PostWithImageCell: UITableViewCell {
    
    static let identifier = "PostWithImageCell"
    weak var delegate: PostCellDelegate?
    
    private let popularLabel: UILabel = {
        let label = UILabel()
        label.text = "Popular today"
        label.font = .rounded(ofSize: 12, weight: .medium)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let avatarImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 22
        iv.backgroundColor = .systemGray5
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(ofSize: 13, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(ofSize: 13, weight: .regular)
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .secondaryLabel
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(ofSize: 16, weight: .regular)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 16
        iv.backgroundColor = .systemGray6
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    // Book Reference Row
    private let bookReferenceContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let bookTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bookThumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 6
        iv.backgroundColor = .systemGray5
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var likeButton: UIButton = {
        let button = PostWithImageCell.createEngagementButton(imageName: "heart")
        button.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = PostWithImageCell.createEngagementButton(imageName: "message")
        button.addTarget(self, action: #selector(didTapComment), for: .touchUpInside)
        return button
    }()
    
    private let shareButton: UIButton = createEngagementButton(imageName: "square.and.arrow.up")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    @objc private func didTapLike() {
        delegate?.postCellDidTapLike(self)
    }
    
    @objc private func didTapComment() {
        delegate?.postCellDidTapComment(self)
    }
    
    private static func createEngagementButton(imageName: String) -> UIButton {
        let button = UIButton(type: .system)
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: imageName)
        config.imagePadding = 6
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        button.configuration = config
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func setupUI() {
        contentView.addSubview(popularLabel)
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(optionsButton)
        contentView.addSubview(contentLabel)
        contentView.addSubview(postImageView)
        contentView.addSubview(bookReferenceContainer)
        bookReferenceContainer.addSubview(bookTitleLabel)
        bookReferenceContainer.addSubview(bookThumbnailImageView)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(shareButton)
        
        NSLayoutConstraint.activate([
            popularLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            popularLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            avatarImageView.topAnchor.constraint(equalTo: popularLabel.bottomAnchor, constant: 12),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 44),
            avatarImageView.heightAnchor.constraint(equalToConstant: 44),
            
            nameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 12),
            
            timeLabel.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 8),
            
            optionsButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            optionsButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 2),
            subtitleLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            contentLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postImageView.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 12),
            postImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor, multiplier: 0.65),
            
            bookReferenceContainer.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 8),
            bookReferenceContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bookReferenceContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            bookReferenceContainer.heightAnchor.constraint(equalToConstant: 44),
            
            bookTitleLabel.leadingAnchor.constraint(equalTo: bookReferenceContainer.leadingAnchor),
            bookTitleLabel.centerYAnchor.constraint(equalTo: bookReferenceContainer.centerYAnchor),
            
            bookThumbnailImageView.trailingAnchor.constraint(equalTo: bookReferenceContainer.trailingAnchor),
            bookThumbnailImageView.centerYAnchor.constraint(equalTo: bookReferenceContainer.centerYAnchor),
            bookThumbnailImageView.widthAnchor.constraint(equalToConstant: 32),
            bookThumbnailImageView.heightAnchor.constraint(equalToConstant: 44),
            
            likeButton.topAnchor.constraint(equalTo: bookReferenceContainer.bottomAnchor, constant: 12),
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            commentButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 16),
            
            shareButton.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor),
            shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    func configure(with post: Post) {
        nameLabel.text = post.author.name
        timeLabel.text = post.timestamp
        subtitleLabel.text = post.subtitle
        contentLabel.text = post.content
        
        likeButton.setTitle("\(post.likesCount)", for: .normal)
        commentButton.setTitle("\(post.commentsCount)", for: .normal)
        
        let heartImage = post.isLiked ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        likeButton.setImage(heartImage, for: .normal)
        likeButton.tintColor = post.isLiked ? .systemRed : .label
        
        if let avatar = post.author.avatarImageName {
            avatarImageView.image = UIImage(named: avatar)
        } else {
            avatarImageView.image = UIImage(systemName: "person.circle.fill")
        }
        
        if let imageName = post.imageName {
            postImageView.image = UIImage(named: imageName)
            postImageView.isHidden = false
        } else {
            postImageView.isHidden = true
        }
        
        if let book = post.referencedBook {
            bookTitleLabel.text = book.title
            if let cover = book.coverImageName {
                bookThumbnailImageView.image = UIImage(named: cover)
            } else {
                bookThumbnailImageView.backgroundColor = .systemPink.withAlphaComponent(0.3)
            }
            bookReferenceContainer.isHidden = false
        } else {
            bookReferenceContainer.isHidden = true
        }
    }
}
