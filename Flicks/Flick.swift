//
//  Flick.swift
//  Flicks
//
//  Created by Raj Sathyaseelan on 10/15/16.
//  Copyright © 2016 Token. All rights reserved.
//

import UIKit

class Flick {
    
    var title = "No Title"
    var posterPath: String = ""
    
    var posterPathLowRes: String! {
        get {
            return "https://image.tmdb.org/t/p/w45\(self.posterPath)"
        }
        
    }
    
    var posterPathHighRes: String! {
        get {
            return "https://image.tmdb.org/t/p/original\(self.posterPath)"

        }
    }

    
    var originalTitle: String!
    var overview: String!
    var backDropPath: String!
    var adult: Bool!
    var releaseDate: Date!
    var popularity: Double!
    var voteCount: Int!
    var voteAverage: Double!
}

/*
poster_path: "/pFgvoEaiXxgw5GIg2vIxPDYX606.jpg",
adult: false,
overview: "Rachel Watson, an alcoholic who divorced her husband Tom after she caught him cheating on her, takes the train to work daily. She fantasizes about the relationship of her neighbours, Scott and Megan Hipwell, during her commute. That all changes when she witnesses something from the train window and Megan is missing, presumed dead.",
release_date: "2016-10-06",
genre_ids: [
53
],
id: 346685,
original_title: "The Girl on the Train",
original_language: "en",
title: "The Girl on the Train",
backdrop_path: "/fpq86AP0YBYUwNgDvUj5kxwycxH.jpg",
popularity: 7.352096,
vote_count: 89,
video: false,
vote_average: 4.97
 
 The low resolution movie poster is available by appending the returned poster_path to https://image.tmdb.org/t/p/w45
 The high resolution movie poster is available by appending the returned poster_path to https://image.tmdb.org/t/p/original
 */
