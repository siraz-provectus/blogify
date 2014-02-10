require 'yaml'
require 'csv'

namespace :db do
  desc "Add system data"
  task dummy: :environment do
    SeedDummyData.run
  end
end

class SeedDummyData
  class << self
    def run
      add_categories!
      add_tags!
      add_admin!
    end

    def add_categories!
      categories = YAML.load(File.open("#{Rails.root}/lib/tasks/data/categories.yml"))

      categories.each do |category|
        unless Category.exists?(title: category[0])
          parent_category = Category.create!(
            title: category[0]
          )
          
          sub_categories = category[1]
          sub_categories.each do |sub_category|
            unless parent_category.children.exists?(title: sub_category)
              parent_category.children.create!(
                title: sub_category
              )
            end
          end
        end
      end
    end

    def add_tags!
      CSV.open("#{Rails.root}/lib/tasks/data/tags.csv", 'r').each do |row|
        ActsAsTaggableOn::Tag.find_or_create_by_name row[0]
      end
    end

    def add_admin!
      unless User.exists?(email: 'admin@example.com')
        admin = User.new(
          email: 'admin@example.com',
          password: 'aaaaaaaa',
          password_confirmation: 'aaaaaaaa'
        )
        admin.save(validate: false)
        admin.confirm!
        admin.toggle!(:admin)
      end
    end
  end
end