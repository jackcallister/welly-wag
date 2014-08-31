require 'active_support/concern'
require 'redcarpet'

# Markdownable: Add markdown support to any column with the text datatype.
#
module Markdownable
  extend ActiveSupport::Concern
  module ClassMethods

    def markdownable_columns
      self.columns.select { |c| c.type == :text }.map { |c| c.name.to_sym }
    end
  end

  included do

    self.markdownable_columns.each do |markdownable_column|

      define_method :"#{markdownable_column}_html" do
        text = send(markdownable_column)
        Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(text).html_safe
      end

      define_method :"short_#{markdownable_column}_html" do
        text = send(markdownable_column).truncate(260)
        Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(text).html_safe
      end
    end
  end
end
