'use strict';

var favoritesServices = angular.module('favoritesServices', ['ngResource']);

favoritesServices.factory('FavoritesList',[
  '$resource',
  function($resource) {
	  return $resource('/favorites.json', {}, {
	    list: { method: 'GET', isArray: true },
	  });
  }]);

favoritesServices.factory('FavoriteDetail', [
  '$resource',
  function($resource) {
	  return $resource('/favorites/:id.json', {}, {
	    query: { method: 'GET', isArray: false }
	  });
  }]);

