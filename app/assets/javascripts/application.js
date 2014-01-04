// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require google-maps
//= require angular
//= require angular-route
//= require angular-resource
//= require angular-sanitize
//= require angular-google-maps
//= require angular-retina
//= require favorites/services
//= require favorites/controllers
//= require photos/services
//= require photos/controllers
//= require blog/services
//= require blog/controllers
//= require_directory .

'use strict'

/* Tell angular to reload when back buttons are pressed, etc */
$(document).on('page:load', function() {
  $('[ng-app]').each(function() {
	  var module = $(this).attr('ng-app');
	  angular.bootstrap(this, [module]);
  });
});

/* Allow arrow keys to handle pages and switch photos */
function keyHandler(e) {
  e = e || window.event;

  if (e.keyCode == '37') {
    $('#link-newer').first().click();
  }
  else if (e.keyCode == '39') {
    $('#link-older').first().click();    
  }
}

document.onkeydown = keyHandler;

var publicApp = angular.module('publicApp', ['ngRoute', 'ngSanitize', 'ngRetina', 'google-maps', 'favoritesControllers', 'favoritesServices', 'photosControllers', 'photosServices', 'blogServices', 'blogControllers']);

publicApp.controller('AboutController', [ '$scope' , function($scope) {
  $scope.section = 'about';
}]);

publicApp.config(['$httpProvider', '$routeProvider', '$locationProvider', function($httpProvider, $routeProvider, $locationProvider) {
  var authToken = $("meta[name=\"csrf-token\"]").attr("content");
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken;

  $locationProvider.html5Mode(true);

  $routeProvider.
	  when('/favorites/:friendly', {
	    templateUrl: '/favorites/partial/detail.html',
	    controller: 'FavoriteController'
	  }).
	  when('/favorites', {
	    templateUrl: '/favorites/partial/list.html',
	    controller: 'FavoritesController'
	  }).
	  when('/photos/:id', {
	    templateUrl: '/photos/partial/detail.html',
	    controller: 'PhotoController'
	  }).
    when('/photos/page/:page', {
	    templateUrl: '/photos/partial/list.html',
	    controller: 'PhotosController'
    }).
    when('/photos', {
	    templateUrl: '/photos/partial/list.html',
	    controller: 'PhotosController'
    }).
    when('/about', {
      templateUrl: '/about/partial/about.html',
      controller: 'AboutController'
    }).
    when('/', {
      templateUrl: '/blog/partial/blog.html',
      controller: 'BlogController'
    }).
    when('/page/:page', {
      templateUrl: '/blog/partial/blog.html',
      controller: 'BlogController'
    }).    
    when('/:id', {
      templateUrl: '/blog/partial/post.html',
      controller: 'PostController'
    }).
    otherwise({
      templateUrl: '/blog/partial/post.html',
      controller: 'PostController'
    });
}]);
