import UIKit

class ViewController: UIViewController {

    var scrollView: UIScrollView!
    var stackView: UIStackView!
    var containerView, view1, view2: UIView!


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(containerView.frame)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupContainer()
        addView1()
        addView2()
    }

    func setup() {
        scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.backgroundColor = .orange
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func setupContainer() {
        let container = UIView()
        container.backgroundColor = .black
        containerView = container
        scrollView.addSubview(container)
        container.setTranslatesMask()
        container.pinToEdges(view: scrollView)
        container.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true 
    }



    func addView1() {
        let view = UIView()
        view1 = view
        view.backgroundColor = .blue
        containerView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.heightAnchor.constraint(equalToConstant: 200),
                                     view.widthAnchor.constraint(equalToConstant: 200),
                                     view.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 200)])
    }


    func addView2() {
        let view = UIView()
        view2 = view
        view.backgroundColor = .red
        containerView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.heightAnchor.constraint(equalToConstant: 200),
                                     view.widthAnchor.constraint(equalToConstant: 200),
                                     view.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 800),
                                     view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20)
                                    ])
    }

}

extension UIView {
    
    func setTranslatesMask() {
        translatesAutoresizingMaskIntoConstraints = false
    }

    func pinToEdges(view: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
