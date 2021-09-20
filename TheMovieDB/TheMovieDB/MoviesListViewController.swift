//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 8/2/21.
//

import UIKit

class MoviesListViewController: UIViewController {
    @IBOutlet weak var moviesLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let dataManager = DataManager()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.showAllTheMovies { [weak self] in
            DispatchQueue.main.async {
            self?.tableView.reloadData()
            }
        }
        moviesLabel.text = dataManager.movies?.name
    }
}

extension MoviesListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = dataManager.items[indexPath.row]
        guard indexPath.row < dataManager.items.count, let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.titleMovieLabel.text = movie.title
        cell.descriptionMovieLabel.text = movie.overview
        return cell
    }
}

extension MoviesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = dataManager.items[indexPath.row]
        let movieDetails = storyboard?.instantiateViewController(withIdentifier: "MovieDetails") as? MovieDetails
        movieDetails!.originalTitle = movie.originalTitle
        movieDetails!.date = movie.releaseDate ?? ""
        movieDetails!.adult = movie.adult
        movieDetails!.language = movie.originalLanguage
        movieDetails!.popularityScore = movie.popularity
        movieDetails!.overview = movie.overview
        
        self.navigationController?.pushViewController(movieDetails!, animated: true)
    }
}
