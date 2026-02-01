import UIKit

class BookDetailViewController: UIViewController {
    
    var book: Book? {
        didSet {
            updateUI()
        }
    }
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        button.setImage(UIImage(systemName: "xmark", withConfiguration: config), for: .normal)
        button.tintColor = .label
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        button.setImage(UIImage(systemName: "square.and.arrow.up", withConfiguration: config), for: .normal)
        button.tintColor = .label
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.layer.cornerRadius = 22
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let coverImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 16
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(ofSize: 28, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .rounded(ofSize: 20, weight: .medium)
        label.textColor = .white.withAlphaComponent(0.8)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tagsStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 10
        sv.distribution = .fillProportionally
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let statusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Currently Reading", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .rounded(ofSize: 18, weight: .bold)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        button.layer.cornerRadius = 12
        
        let arrowImage = UIImage(systemName: "chevron.down.circle")
        button.setImage(arrowImage, for: .normal)
        button.tintColor = .white
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        button.semanticContentAttribute = .forceRightToLeft
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let bottomChevron: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "chevron.down")
        iv.tintColor = .white.withAlphaComponent(0.6)
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(backgroundView)
        view.addSubview(closeButton)
        view.addSubview(shareButton)
        view.addSubview(coverImageView)
        view.addSubview(titleLabel)
        view.addSubview(authorLabel)
        view.addSubview(tagsStackView)
        view.addSubview(statusButton)
        view.addSubview(bottomChevron)
        
        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            closeButton.widthAnchor.constraint(equalToConstant: 44),
            closeButton.heightAnchor.constraint(equalToConstant: 44),
            
            shareButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            shareButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            shareButton.widthAnchor.constraint(equalToConstant: 44),
            shareButton.heightAnchor.constraint(equalToConstant: 44),
            
            coverImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            coverImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            coverImageView.widthAnchor.constraint(equalToConstant: 220),
            coverImageView.heightAnchor.constraint(equalToConstant: 320),
            
            titleLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            tagsStackView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 32),
            tagsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tagsStackView.heightAnchor.constraint(equalToConstant: 44),
            
            statusButton.topAnchor.constraint(equalTo: tagsStackView.bottomAnchor, constant: 24),
            statusButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            statusButton.widthAnchor.constraint(equalToConstant: 240),
            statusButton.heightAnchor.constraint(equalToConstant: 56),
            
            bottomChevron.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            bottomChevron.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomChevron.widthAnchor.constraint(equalToConstant: 30),
            bottomChevron.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func updateUI() {
        guard let book = book else { return }
        loadViewIfNeeded()
        
        titleLabel.text = book.title
        authorLabel.text = book.author
        if let imageName = book.coverImageName {
            coverImageView.image = UIImage(named: imageName)
        }
        
        if let hex = book.themeColor, let color = UIColor(hex: hex) {
            backgroundView.backgroundColor = color
            // If background is light (like yellow), make text dark
            let brightness = color.brightness()
            let textColor: UIColor = brightness > 0.8 ? .black : .white
            titleLabel.textColor = textColor
            authorLabel.textColor = textColor.withAlphaComponent(0.8)
            closeButton.tintColor = textColor
            shareButton.tintColor = textColor
            statusButton.setTitleColor(textColor, for: .normal)
            statusButton.tintColor = textColor
            statusButton.layer.borderColor = textColor.withAlphaComponent(0.5).cgColor
            bottomChevron.tintColor = textColor.withAlphaComponent(0.6)
        }
        
        // Setup tags
        tagsStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        for genre in book.genres {
            let tagView = createTagView(with: genre)
            tagsStackView.addArrangedSubview(tagView)
        }
    }
    
    private func createTagView(with text: String) -> UIView {
        let container = UIView()
        container.layer.borderWidth = 1
        container.layer.borderColor = titleLabel.textColor.withAlphaComponent(0.5).cgColor
        container.layer.cornerRadius = 8
        
        let label = UILabel()
        label.text = text
        label.font = .rounded(ofSize: 14, weight: .medium)
        label.textColor = titleLabel.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        container.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: container.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -8),
            label.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16)
        ])
        
        return container
    }
    
    @objc private func didTapClose() {
        dismiss(animated: true)
    }
}

extension UIColor {
    func brightness() -> CGFloat {
        var r: CGFloat = 0, g: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (0.299 * r + 0.587 * g + 0.114 * b)
    }
}
