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
    let fetchData = FetchData()
    let rating = StarsRating()
    let imageConverter = ImageConverter()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData.showAllTheMovies { [weak self] in
            DispatchQueue.main.async {
            self?.tableView.reloadData()
                self?.moviesLabel.text = self?.fetchData.movies?.name
            }
        }
    }
}
extension MoviesListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchData.items.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = fetchData.items[indexPath.row]
        guard indexPath.row < fetchData.items.count, let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.titleMovieLabel.text = movie.title
        cell.dateLabel.text = movie.releaseDate
        cell.voteAverageLabel.text = rating.showVoteAverage(voteAverage: movie.voteAverage)
        cell.imageLabel.image = UIImage(data: imageConverter.convertURLToImage(imageUrlString: "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "")"))
        return cell
    }
}
extension MoviesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = fetchData.items[indexPath.row]
        let movieDetails = storyboard?.instantiateViewController(withIdentifier: "MovieDetails") as? MovieDetails
        movieDetails!.originalTitle = movie.originalTitle
        movieDetails!.date = movie.releaseDate ?? ""
        movieDetails!.adult = movie.adult
        movieDetails!.language = movie.originalLanguage
        movieDetails!.overview = movie.overview
        movieDetails!.imageMovie = UIImage(data: imageConverter.convertURLToImage(imageUrlString: "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "")"))
        movieDetails!.voteCount = movie.voteCount
        movieDetails!.starRating = movie.voteAverage
        self.navigationController?.pushViewController(movieDetails!, animated: true)
    }
}
