'use strict'

var favoritesApp = angular.module('favoritesApp', ['ngRoute', 'ngSanitize', 'google-maps', 'favoritesControllers', 'favoritesServices']);

favoritesApp.config(['$httpProvider', '$routeProvider', '$locationProvider', function($httpProvider, $routeProvider, $locationProvider) {
  var authToken = $("meta[name=\"csrf-token\"]").attr("content");
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;

  $routeProvider.
    when('/favorites/:friendly', {
      templateUrl: '/partials/favorites/detail.html',
      controller: 'FavoriteController'
    }).
    otherwise({
      templateUrl: '/partials/favorites/list.html',
      controller: 'FavoritesController'
    });

  $locationProvider.html5Mode(true);
}]);
