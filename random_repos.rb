require "bundler"
Bundler.setup

require "octokit"
require "csv"

client = Octokit::Client.new(:access_token => ENV["ACCESS_TOKEN"])
path_to_bigquery_csv = "./data.csv"

def repo_name_from_row(row)
  row[0].gsub("https://github.com/", "")
end

CSV.foreach(path_to_bigquery_csv) do |row|
  repo_name = repo_name_from_row(row)
  next if repo_name.empty? || repo_name == "repository_url"
  # You'll want to have this collect the data you're interested in from each repository.
  puts client.repository(repo_name).inspect
end
