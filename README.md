## MusicBrainz Web Service wrapper [![Travis CI](https://secure.travis-ci.org/magnolia-fan/musicbrainz.png)](http://travis-ci.org/magnolia-fan/musicbrainz)

### Installation
```bash
gem install musicbrainz
```
or add this line to your Gemfile
```ruby
gem "musicbrainz"
```

### Usage
```ruby
require "musicbrainz"

# Search for artists
@suggestions = MusicBrainz::Artist.search("Jet")

# Find artist by name or mbid
@foo_fighters = MusicBrainz::Artist.find_by_name("Foo Fighters")
@kasabian = MusicBrainz::Artist.find("69b39eab-6577-46a4-a9f5-817839092033")

# Use them like ActiveRecord models
@empire_tracks = @kasabian.release_groups[8].releases.first.tracks

# Setting a cache path enables caching of requests
MusicBrainz::Tools::Cache.cache_path = "tmp/cache"

# Configuring request interval
MusicBrainz::Tools::Proxy.query_interval = 1.2 # seconds
```

### Api

MusicBrainz::Artist
```ruby
@artists = MusicBrainz::Artist.search(query)
@artist = MusicBrainz::Artist.find_by_name(name)
@artist = MusicBrainz::Artist.find(mbid)
@artist.id
@artist.type
@artist.name
@artist.country
@artist.date_begin
@artist.date_end
@artist.release_groups
```

MusicBrainz::ReleaseGroup
```ruby
@release_group = MusicBrainz::ReleaseGroup.find(mbid)
@release_group.id
@release_group.type
@release_group.title
@release_group.first_release_date
@release_group.releases
```

MusicBrainz::Release
```ruby
@release = MusicBrainz::Release.find(mbid)
@release.id
@release.title
@release.status
@release.date
@release.country
@release.tracks
```

MusicBrainz::Track
```ruby
@track = MusicBrainz::Track.find(mbid)
@track.position
@track.recording_id
@track.title
@track.length
```

### Testing
```bash
bundle rake spec
```

### Debug console
```bash
bundle rake console
```

### Contributing

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

### Copyright

Copyright (c) 2011 Gregory Eremin. See [LICENSE](https://raw.github.com/magnolia-fan/musicbrainz/master/LICENSE) for further details.
