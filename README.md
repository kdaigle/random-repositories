# Finding A Set Of Repositories

Head over to Google BigQuery and their collection of GitHub Timeline data.

https://bigquery.cloud.google.com/table/githubarchive:github.timeline

Find the total number of created repositories that are public and known to Google BigQuery.

`SELECT COUNT(repository_url) FROM [githubarchive:github.timeline] WHERE type = "CreateEvent" AND payload_ref IS NULL`

Select a subset of the repositories by URL. This will find roughly 10,000 repository URLs.

`SELECT repository_url FROM [githubarchive:github.timeline] WHERE type = "CreateEvent" AND payload_ref IS NULL AND RAND() < 10000/13626213 `

Export the results to CSV.

Then, pull do this repository. Run `bundle install`. Set the `path_to_bigquery_csv` variables to the full file path to your CSV.

Setup a GitHub [personal access token](https://help.github.com/articles/creating-an-access-token-for-command-line-use/) with `public_repo` scope.

Run the script with your personal access token. Note: you can only make 5,000 requests per hour to the API. If you need more repositories than that, you'll need to adjust the script to split into groups.

`ACCESS_TOKEN=yourPersonalAccessToken ruby random_repos.rb`
