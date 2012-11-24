module Jekyll

  class CategoryGroups < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      @opts = {}
      super
    end 

    def render(context)
      html = ''

      config = context.registers[:site].config
      categories = context.registers[:site].categories
      category_dir = config['root'] + config['category_dir'] + '/'

      group_suffix = config['category_group_suffix'] || "_group"
      group_unused_name = config['category_group_unused'] || "Ungrouped"

      #html << "unused: #{group_unused_name}<br />"
      #html << "suffix: #{group_suffix}<br />"
      #html << "cats: #{categories}<br />"

      groups = Hash.new

      categories.each_key do |category|
        group = config[ category.gsub(" ","_") + group_suffix ]

        groups[ group ] ||= Array.new
        groups[ group ] << category
      end

      not_grouped = groups.delete nil

      groups.keys.sort().each do |groupname|
        cat = groups[ groupname ]
        html << "<li>#{groupname}</li>"
        html << "<ul>"
        cat.sort.each do |category|
          url = category_dir + category.gsub(/_|\P{Word}/u, '-').gsub(/-{2,}/u, '-').downcase
          html << "<li><a href='#{url}'>#{category}</a></li>"
        end
        html << "</ul>"
      end

      html << "<li>#{group_unused_name}</li>"
      html << "<ul>"
      not_grouped.sort.each do |ng|
        url = category_dir + ng.gsub(/_|\P{Word}/u, '-').gsub(/-{2,}/u, '-').downcase
        html << "<li><a href='#{url}'>#{ng}</a></li>"
      end
      html << "</ul>"

      html
    end

    def groupname(category, group_suffix)
      cat_name = category.first.to_s
      (cat_name + group_suffix.to_s).gsub(" ","_")
    end

  end

end

Liquid::Template.register_tag('category_groups', Jekyll::CategoryGroups)
