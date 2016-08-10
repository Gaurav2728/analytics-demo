var app = angular.module('AnalyticsDemo', []);

app.controller('TopUrls', function($scope, $http) {
    $http.get('/top_urls.json')
      .then(function(result){
        $scope.reports = result.data;
      })
});

app.controller('TopReferrers', function($scope, $http) {
    $http.get('/top_referrers.json')
      .then(function(result){
        $scope.reports = result.data;
      })
});
