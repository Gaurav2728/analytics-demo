# It's All About Stats

This is a Rails application that uses MySQL, Sequel, and AngularJS to calculate and display:

1. Number of page views per URL, grouped by day, for the past 5 days

2. Top 5 referrers for the top 10 URLs, grouped by day, for the past 5 days

## Running the application

To run this application, you will need Rails and MySQL installed.

```
$ bundle install
$ rake db:reset
$ rails server
```

## Viewing the data

Visit [http://localhost:3000/top_urls](http://localhost:3000/top_urls) to
see the page views per URL, grouped by day, for the past 5 days.

Visit [http://localhost:3000/top_referrers](http://localhost:3000/top_referrers) to
see the top 5 referrers for the top 10 URLs, grouped by day, for the past 5 days.

## TODO

* Add pagination to the API calls so it will not be slow while fetching so many records.
