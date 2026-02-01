import UIKit

protocol HomeHeaderViewDelegate: AnyObject {
    func homeHeaderViewDidTapTrending(_ headerView: HomeHeaderView)
}

class HomeHeaderView: UIView {
    
    weak var delegate: HomeHeaderViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.font = .systemFont(ofSize: 32, weight: .bold, width: .standard)
        if let descriptor = label.font.fontDescriptor.withDesign(.rounded) {
            label.font = UIFont(descriptor: descriptor, size: 32)
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let notificationButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        button.setImage(UIImage(systemName: "bell", withConfiguration: config), for: .normal)
        button.tintColor = .label
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 20
        iv.backgroundColor = .systemGray5
        iv.translatesAutoresizingMaskIntoConstraints = false
        // Profile image from assets
        iv.image = UIImage(named: "profilehome")
        return iv
    }()
    
    private let todayLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = .systemFont(ofSize: 26, weight: .bold, width: .standard)
        if let descriptor = label.font.fontDescriptor.withDesign(.rounded) {
            label.font = UIFont(descriptor: descriptor, size: 26)
        }
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let trendingLabel: UILabel = {
        let label = UILabel()
        label.text = "Trending Book >"
        label.isUserInteractionEnabled = true
        label.font = .rounded(ofSize: 18, weight: .semibold)
        if let descriptor = label.font.fontDescriptor.withDesign(.rounded) {
            label.font = UIFont(descriptor: descriptor, size: 18)
        }
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(notificationButton)
        addSubview(profileImageView)
        addSubview(todayLabel)
        addSubview(trendingLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40),
            
            notificationButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            notificationButton.trailingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: -12),
            notificationButton.widthAnchor.constraint(equalToConstant: 40),
            notificationButton.heightAnchor.constraint(equalToConstant: 40),
            
            todayLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            todayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            trendingLabel.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 12),
            trendingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            trendingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTrendingTap))
        trendingLabel.addGestureRecognizer(tap)
    }
    
    @objc private func handleTrendingTap() {
        delegate?.homeHeaderViewDidTapTrending(self)
    }
}
