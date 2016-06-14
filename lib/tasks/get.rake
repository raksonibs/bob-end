namespace :get do

  desc 'Grab articles'
  task :nyt => :environment do 
    uri = URI("https://api.nytimes.com/svc/news/v3/content/all/all.json")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    uri.query = URI.encode_www_form({
      "api-key" => "2433ac423b5a4f9d8ac71a940040b97b"
    })
    request = Net::HTTP::Get.new(uri.request_uri)
    @result = JSON.parse(http.request(request).body)
    # @result["results"].each {|e| Article.create({title: e["title"], section: e["section"], sub_section: e["sub_section"], abstract: e["abstract"], url: e["multimedia"]["url"]})}
    @result["results"].each do |e|
      begin
        Article.create({title: e["title"], section: e["section"], sub_section: e["sub_section"], abstract: e["abstract"], url: e["url"]})
      rescue
        puts "Error with #{e}"
      end
    end
  end
end