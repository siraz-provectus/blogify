require 'yaml'

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
  end
end