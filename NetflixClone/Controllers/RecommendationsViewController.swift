//
//  RecommendationsViewController.swift
//  NetflixClone
//
//  Created by Kostya Lee on 03/03/22.
//

import UIKit

struct Section {
    let title: String
    var movies: [Movie]
    
    init(title: String) {
        self.title = title
        movies = [Movie(), Movie(), Movie(), Movie()]
    }
    
    init(title: String, movies: [Movie]) {
        self.title = title
        self.movies = movies
    }
}

class RecommendationsViewController: UITableViewController {
    
    let sections: [Section] = [
        Section(title: "Top rated"),
        Section(title: "Best"),
        Section(title: "Doctor strange")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.register(CollectionTableViewCell.self, forCellReuseIdentifier: CollectionTableViewCell.id)
        tableView.tableHeaderView = TableHeaderView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 350))
    }
}

extension RecommendationsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.id, for: indexPath) as! CollectionTableViewCell
        cell.setMovies(sections[indexPath.row].movies)
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
}
