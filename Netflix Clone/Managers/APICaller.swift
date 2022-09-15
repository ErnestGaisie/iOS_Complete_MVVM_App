//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Gaisie on 2022/9/14.
//

import Foundation

struct Constants {
    static let API_Key = "529286fcb1197ff929936ed730a83a26"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedToGetData
}

class APICaller {
    static let shared  = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_Key)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
//                let results = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(error))
            }

        }
        
        task.resume()
        
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Tv], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_Key)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(error))
            }

        }
        
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_Key)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
//                completion(.success(results.results))
            }
            catch{
                completion(.failure(error))
            }

        }
        
        task.resume()
    }
    
    
    func getPopuplar(completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_Key)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
//                completion(.success(results.results))
            }
            catch{
                completion(.failure(error))
            }

        }
        
        task.resume()
    }
    
    func getTopRated(completion: @escaping (Result<[Movie], Error>) -> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_Key)&language=en-US&page=1") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
//                completion(.success(results.results))
            }
            catch{
                completion(.failure(error))
            }

        }
        
        task.resume()
    }


}
