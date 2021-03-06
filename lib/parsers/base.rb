# -*- encoding: utf-8 -*-

module MusicBrainz
  module Parsers
    class << self
      def get_by_name(name)
        case name
        when :artist_model
          { :const => MusicBrainz::Parsers::Artist, :method => :model }
        when :artist_search
          { :const => MusicBrainz::Parsers::Artist, :method => :search }
        when :artist_release_groups
          { :const => MusicBrainz::Parsers::Artist, :method => :release_groups }
        when :release_group_model
          { :const => MusicBrainz::Parsers::ReleaseGroup, :method => :model }
        when :release_group_releases
          { :const => MusicBrainz::Parsers::ReleaseGroup, :method => :releases }
        when :release_model
          { :const => MusicBrainz::Parsers::Release, :method => :model }
        when :release_tracks
          { :const => MusicBrainz::Parsers::Release, :method => :tracks }
        when :track_model
          { :const => MusicBrainz::Parsers::Track, :method => :model }
        end
      end
    end

    class Base
      class << self
        def safe_get_attr(xml, path, name)
          node = path.nil? ? xml : (xml.css(path).first unless xml.css(path).empty?)
          node.attr(name) unless node.nil? or node.attr(name).nil?
        end

        def safe_get_value(xml, path)
          xml.css(path).first.text unless xml.css(path).empty?
        end
      end
    end
  end
end
