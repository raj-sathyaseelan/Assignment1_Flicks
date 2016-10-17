# Assignment1_Flicks

This is an iOS demo application for displaying the latest box office movies using the [RottenTomatoes API](http://www.rottentomatoes.com/). See the [RottenTomatoes Networking Tutorial](https://github.com/codepath/android_guides/wiki/Rotten-Tomatoes-Networking-Tutorial) on our cliffnotes for a step-by-step tutorial.

Time spent: 10 hours spent in total

Completed user stories:

 * [x] Required: User can view a list of movies currently playing in theatres from the Movie Database with poster images loading asyncrhonously using AFNetworking. title, cast and tomatoes rating
 * [x] Required: User can click on a movie in the list to bring up a details page with additional information such as synopsis
 * [x] Optional: Placeholder image is used for movie posters loaded in from the network
 
Notes:

The following user stories must be completed:

User can view a list of movies currently playing in theaters from The Movie Database. Poster images must be loaded

User sees loading state while waiting for movies API. You can use one of the 3rd party libraries listed on CocoaControls.
User sees an error message when there's a networking error. You may not use UIAlertController or a 3rd party library to display the error. See this screenshot for what the error message should look like.
Hint: Using the hidden property of a view can be helpful to toggle the network error view's visibility.
Hint: You can simulate a network error, by turning off the wifi on your computer before running the simulator. You will also want to Reset Content and Settings in your simulator (Found under the Simulator drop down menu) before you run the app, otherwise the images will be fetched from the cache instead of the network. The setImageWithURL method stores images in cache automatically behind the scenes.
User can pull to refresh the movie list.
The following advanced user stories are optional: (high, med, and low refer to the effort to implement the feature, with high being the most work and low being the least)

Add a tab bar for Now Playing or Top Rated movies. (high)

Hint: If you are using a storyboard for your app, there isn't a good way to use the same UIViewController for each tab of your UITabBarController. Instead, you might want to use a xib approach for each UIViewController and set up your tab bar programmatically.

Spent some time making the UI work across multiple phone resolutions by playing around with the RelativeLayout.

Walkthrough of all user stories:

![Video Walkthrough](anim_rotten_tomatoes.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/)
