//
//  PageViewController.swift
//  caixaApp
//
//  Created by Gabriel Leal dos Santos on 28/11/22.
//

import UIKit

/*
 Simple example of UIPageViewController.
*/

class PageViewController: UIPageViewController {

    var pages = [UIViewController]()
    let pageControl = UIPageControl() // external - not part of underlying pages
    let initialPage = 0
    
    private let nextArrowButton : UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "arrow")
        
        button.setImage(image, for:.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(handlerNext), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func handlerNext(){
        let nextindex = min(pageControl.currentPage + 1, pages.count - 1)

        pageControl.currentPage = nextindex
        setViewControllers([pages[nextindex]], direction: .forward, animated: true, completion: nil)
    }
    
    
     init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [String : Any]? = nil) {
            super.init(transitionStyle: style, navigationOrientation: navigationOrientation, options: nil)
        }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        style()
        layout()
        
        pageControl.transform = CGAffineTransform(scaleX: 2, y: 2);
        pageControl.currentPageIndicatorTintColor = .white

    }
    
}

extension PageViewController {
    
    func setup() {
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)

        // create an array of viewController
        let page1 = ViewController1()
        let page2 = ViewController2()

        pages.append(page1)
        pages.append(page2)
        
        // set initial viewController to be displayed
        // Note: We are not passing in all the viewControllers here. Only the one to be displayed.
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
    
    func style() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage

    }
    
    func layout() {
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [pageControl, nextArrowButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlsStackView)
        
        
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 20),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
        ])
        
//        view.addSubview(pageControl)
        
//        NSLayoutConstraint.activate([
//            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
//            pageControl.heightAnchor.constraint(equalToConstant: 20),
//            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
//        ])
    }
}

// MARK: - Actions

extension PageViewController {
    
    // How we change page when pageControl tapped.
    // Note - Can only skip ahead on page at a time.
    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }

}

// MARK: - DataSources

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }
        
        if currentIndex == 0 {
            return pages.last               // wrap to last
        } else {
            return pages[currentIndex - 1]  // go previous
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else { return nil }

        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]  // go next
        } else {
            return pages.first              // wrap to first
        }
    }
    
    
}

// MARK: - Delegates

extension PageViewController: UIPageViewControllerDelegate {
    
    // How we keep our pageControl in sync with viewControllers
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else { return }
        
        pageControl.currentPage = currentIndex
    }
}

// MARK: - ViewControllers

class ViewController1: UIViewController {
    private lazy var image1: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "Mask")
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var image2: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "Mask-1")
        
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var labelTitle: UILabel = {
        var label = UILabel()
        
        label.text = "Um cartão para chamar de seu."
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = UIColor.white
        
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelSubtitle: UILabel = {
        var label = UILabel()
        
        label.text = "O novo cartão da caixa se encaixa perfeitamente na vida de quem precisa de toda modernidade na palma de sua mão."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white
        
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setDefaultGradientBackground()
        view.addSubview(image1)
        view.addSubview(image2)
        view.addSubview(labelTitle)
        view.addSubview(labelSubtitle)
        
        NSLayoutConstraint.activate([
            image1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 45),
            image1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            image2.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0)
           
        ])
        
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: image2.bottomAnchor, constant: 15),
            labelTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            labelTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])

        NSLayoutConstraint.activate([
            labelSubtitle.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 15),
            labelSubtitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            labelSubtitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])

    }
}

class ViewController2: UIViewController {
    
    private lazy var image2: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "girl-caixa")
        
        imageView.image = image
        imageView.contentMode = .scaleToFill
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var labelTitle: UILabel = {
        var label = UILabel()
        
        label.text = "Mais completo e mais rápido."
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = UIColor.white
        
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelSubtitle: UILabel = {
        var label = UILabel()
        
        label.text = "O novo AppCaixa conta com toda modernidade na palma de sua mão."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.white
        
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setDefaultGradientBackground()
        
        view.addSubview(image2)
        view.addSubview(labelTitle)
        view.addSubview(labelSubtitle)
        
        NSLayoutConstraint.activate([
            image2.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            image2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0),
            image2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: image2.bottomAnchor, constant: -36),
            labelTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            labelTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])

        NSLayoutConstraint.activate([
            labelSubtitle.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 15),
            labelSubtitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            labelSubtitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])

    }
    
}


