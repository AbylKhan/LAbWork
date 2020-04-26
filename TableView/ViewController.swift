//
//  ViewController.swift
//  TableView
//
//  Created by Abylaikhan Koshanov on 4/4/20.
//  Copyright © 2020 Abylaikhan Koshanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

   
    
    @IBOutlet weak var tableView: UITableView!
    lazy var refreshControl: UIRefreshControl = {
           let view = UIRefreshControl()
           view.addTarget(self, action: #selector(downloadMovies), for: .valueChanged)
           
           return view
       }()
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.refreshControl = refreshControl
               downloadMovies()
    }
    
    @objc func downloadMovies() {
          MovieService.shared.downloadMovies { response in
              self.movies = response.movies
              self.tableView.refreshControl?.endRefreshing()
              self.tableView.reloadData()
          }
      }


}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movie" , for: indexPath) as! MovieTableViewCell
        cell.movie = self.movies[indexPath.row]
        
        return cell
    }
    
       
   }
