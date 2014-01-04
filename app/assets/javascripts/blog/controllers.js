'use strict'

var blogControllers = angular.module('blogControllers', []);

blogControllers.controller('BlogController', [ '$scope', '$routeParams', '$sce', 'BlogPage', function($scope, $routeParams, $sce, BlogPage) {
  $scope.section = 'blog';

  var pageNum = parseInt($routeParams.page || 1);
  $scope.blogPage = BlogPage.get({ page: pageNum });

  if(pageNum > 1) {
    $scope.newerPage = pageNum - 1;
  }

  $scope.blogPage.$promise.then(function(blogPage) {  
    if(pageNum < blogPage.total_pages) {
      $scope.olderPage = pageNum + 1;
    }
  });

  $scope.bodyOf = function(post) {
    if(post && post.body) {
      return $sce.trustAsHtml(post.body);
    }
  };
}]);

blogControllers.controller('PostController', [ '$scope', '$routeParams', '$sce', 'BlogPost', function($scope, $routeParams, $sce, BlogPost) {
  $scope.section = 'blog';

  $scope.post = BlogPost.query({ id: $routeParams.id });

  $scope.bodyOf = function(post) {
    if(post && post.body) {
      return $sce.trustAsHtml(post.body);
    }
  };
}]);
