import UIKit

class ViewController: UIViewController {

    var scrollView: UIScrollView!
    var stackView: UIStackView!
    var containerView, view1, view2: UIView!



    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
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

    func setupStackView() {
        stackView = UIStackView()
        stackView.backgroundColor = .green
        stackView.axis = .vertical
        stackView.spacing = 40
        scrollView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }

    func setupContainer() {
        let container = UIView()
        container.backgroundColor = .black
        containerView = container
        container.setTranslatesMask()
    }



    func addView1() {
        let view = UIView()
        view1 = view
        view.backgroundColor = .blue
        scrollView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.heightAnchor.constraint(equalToConstant: 200),
                                     view.widthAnchor.constraint(equalToConstant: 200),
                                     view.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 200)])
    }


    func addView2() {
        let view = UIView()
        view2 = view
        view.backgroundColor = .red
        scrollView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.heightAnchor.constraint(equalToConstant: 200),
                                     view.widthAnchor.constraint(equalToConstant: 200),
                                     view.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 800),
                                     view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
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
