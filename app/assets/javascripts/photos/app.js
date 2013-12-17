'use strict'

var photosApp = angular.module('photosApp', ['ngRoute', 'photosControllers', 'photosServices', 'ngRetina']);

photosApp.config(['$httpProvider', '$routeProvider', '$locationProvider', function($httpProvider, $routeProvider, $locationProvider) {
  var authToken = $("meta[name=\"csrf-token\"]").attr("content");
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;

  $routeProvider.
	  when('/photos/:id', {
	    templateUrl: '/partials/photos/detail.html',
	    controller: 'PhotoController'
	  }).
    when('/photos/page/:page', {
	    templateUrl: '/partials/photos/list.html',
	    controller: 'PhotosController'
    }).
    when('/photos', {
	    templateUrl: '/partials/photos/list.html',
	    controller: 'PhotosController'
    })

  $locationProvider.html5Mode(true);
}]);
