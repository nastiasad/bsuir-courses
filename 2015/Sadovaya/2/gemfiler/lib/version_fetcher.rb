require 'json'

class VersionFetcher
  def fetch(name)
    result = `curl https://rubygems.org/api/v1/versions/#{name}.json`
    json = JSON.parse(result)
    json.map! { |s| s['number'] }
  end
end
