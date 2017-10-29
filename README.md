# README

Read about this repo in my blog post [here](https://www.neontuna.com/blog/2017/09/11/pinballer/)

IFPA API docs and key request https://www.ifpapinball.com/api/documentation/

Matchplay Events API docs https://matchplay.events/api-docs/

### Setup

Matchplay does not require an API key but IFPA does.  Once you're requested one from the link above,
use figaro to add it to the Repo

```bash
bundle exec figaro install
```

This creates a commented `config/application.yml` file and adds it to your
`.gitignore`. (you don't want this file committed to source control!)

Within `application.yml` add your IFPA key

```
ifpa_api_key: 123465465456465465456465456
```

And now the player model can grab its IFPA stats

```ruby
response = HTTParty.get(
      "https://api.ifpapinball.com/v1/player/#{id}?api_key=#{ENV["ifpa_api_key"]}", 
      format: :json)
```