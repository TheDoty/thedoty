'use strict'

var photosServices = angular.module('photosServices', [ 'ngResource' ]);

photosServices.factory('PhotoPage', [ '$resource', function($resource) {
  return $resource('/photos/page/:page.json', {}, {
    get: { method: 'GET', isArray: false },
  });
}]);

photosServices.factory('PhotoDetail', [ '$resource', function($resource) {
  return $resource('/photos/:id.json', {}, {
    query: { method: 'GET', isArray: false },
  });
}]);
  
