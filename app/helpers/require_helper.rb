module Sinatra
  module Requireable
    def must_include_key(key)
      self[key].presence || raise(ArgumentError)
    end

    def presence
      self if present?
    end

    def present?
      !blank?
    end

    def blank?
      respond_to?(:empty?) ? empty? : !self
    end
  end

  helpers Requireable
end