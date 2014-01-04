'use strict'

var photosControllers = angular.module('photosControllers', []);

photosControllers.controller('PhotosController', [ '$scope', '$routeParams', 'PhotoPage', function($scope, $routeParams, PhotoPage) {
  $scope.section = 'photos';

  var pageNum = parseInt($routeParams.page || 1);
  $scope.photoPage = PhotoPage.get({ page: pageNum });

  if(pageNum > 1) {
    $scope.newerPage = pageNum - 1;
  }

  $scope.photoPage.$promise.then(function(photoPage) {  
    if(pageNum < photoPage.total_pages) {
      $scope.olderPage = pageNum + 1;
    }
  });
}]);

photosControllers.controller('PhotoController', [ '$scope', '$routeParams', 'PhotoDetail', function($scope, $routeParams, PhotoDetail) {
  $scope.section = 'photos';

  $scope.photo = PhotoDetail.query({ id: $routeParams.id });
}]);
