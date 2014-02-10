require "#{Rails.root}/lib/tags_autocomplete.rb"

ActsAsTaggableOn::Tag.send(:extend, TagsAutocomplete)