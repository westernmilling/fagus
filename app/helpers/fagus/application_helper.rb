# Fagus
module Fagus
  # ApplicationHelper
  module ApplicationHelper
    # A simple way to show the error messages for an ActiveRecord model.
    # @params object [Object] the object inheriting from ActiveRecord::Base.
    # @return [String] the error messages in HTML.
    def error_messages(object)
      return nil if object.errors.blank?

      errors = object
        .errors
        .full_messages
        .map { |message| "<li>#{message}</li>" }

      ['<div><h2>Errors</h2>', '<ul>', errors, '</ul>', '</div>'].flatten.join
    end
  end
end
