'use strict'

var favoritesControllers = angular.module('favoritesControllers', [ 'google-maps' ]);

favoritesControllers.controller('FavoritesController', [ '$scope', 'FavoritesList', function($scope, FavoritesList) {
  $scope.favorites = FavoritesList.list();
  $scope.viewType = 'everything';

  $scope.filterFunction = function(viewType) {
    if(viewType == 'food') {
      return function(favorite) {
        return favorite.has_food;
      }
    } else if(viewType == 'coffee') {
      return function(favorite) {
        return favorite.has_coffee;
      }
    } else if(viewType == 'drinks') {
      return function(favorite) {
        return favorite.has_drinks;
      }
    } else {
      return function(favorite) {
        return true;
      }
    }
  };
}]);

favoritesControllers.controller('FavoriteController', [ '$scope', '$routeParams', 'FavoriteDetail', function($scope, $routeParams, FavoriteDetail) {    
  angular.extend($scope, {
    // Start at Denver and get a neat zoom in effect when we have the data
    center: { latitude: 39.737567, longitude: -104.984718 },
    markers: [],
    zoom: 11,
  });

  $scope.favorite = FavoriteDetail.query({id: $routeParams.friendly});

  // When we have the promise data, update the map.
  $scope.favorite.$promise.then(function(fav) {
    var lat = fav.latitude;
    var lon = fav.longitude;

    if (lat > 0) {
      $scope.center = { latitude: lat, longitude: lon };
      $scope.markers = [{ latitude: lat, longitude: lon }];
      $scope.zoom = 13;
    }
  });
}]);
