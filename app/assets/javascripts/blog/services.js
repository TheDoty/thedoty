'use strict'

var blogServices = angular.module('blogServices', [ 'ngResource' ]);

blogServices.factory('BlogPage', [ '$resource', function($resource) {
  return $resource('/page/:page.json', {}, {
    get: { method: 'GET', isArray: false },
  });
}]);

blogServices.factory('BlogPost', [ '$resource', function($resource) {
  return $resource('/:id.json', {}, {
    query: { method: 'GET', isArray: false },
  });
}]);
