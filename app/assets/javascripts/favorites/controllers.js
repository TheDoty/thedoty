'use strict'

var favoritesControllers = angular.module('favoritesControllers', []);

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
}
}]);

favoritesControllers.controller('FavoriteController', [ '$scope', '$routeParams', 'FavoriteDetail', function($scope, $routeParams, FavoriteDetail) {
  $scope.favorite = FavoriteDetail.query({id: $routeParams.friendly});
}]);
