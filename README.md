<p align="center">
<img src="https://stormideas.com/images/logo.svg">
</p>


iOS home task project
==================================

## About this repository

This repository contains brand new iOS project with Storyboards removed and ready to write the UI programatically with UIKit so you don't waste time to set it up. You can fork this repository and work on forked one and once you are ready you can create a pull request to this repository

## Description

The main idea is to build an app that shows list of places where each place has its own set of photos.

### Places screen

A place has name and thumbnail image and it's up to you how to display it however they should be sorted in alphabetical order.

To retrieve the places you can use the following API:

* https://608948878c8043001757e68c.mockapi.io/api/v1/places

When a place is tapped the app should go to the photos screen

### Photos screen

Photos screen will have all photos of the place presented ordered by `createdAt` parameter showing the newest as the first one.

To retrieve the list of photos you can use the following API (replace `[PLACE_ID]` with the id you get from `/places` API call):

* https://608948878c8043001757e68c.mockapi.io/api/v1/places/[PLACE_ID]/photos

It is required to present photos in the UICollectionView in such a way that each cell contains single photo and the cell is filling all possible space (so showing one cell at the time). Think of it like a fullscreen photos gallery where user can see one photo at the time.

User should be able to switch between next / previous photo by swiping left and right

## Additional requirements
* There should be some kind of caching mechanism to download each photo only once even if user opens the same place twice. There is no need for persistence so cache can reset every app launch. 
* UI should be written programmatically using UIKit therefore no using Storyboards / XIBs
* You can use any 3rd party library you wish however in our current projects we try to keep the number of dependencies to minimum so it'd be good to justify it.
* You can use any version of Swift / XCode / iOS

## Thank you for your time and we are looking forward to see your solution
If you have any additional questions please feel free to ask our team member who sent you information about this task.
