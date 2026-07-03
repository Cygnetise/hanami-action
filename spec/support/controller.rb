# frozen_string_literal: true

if defined?(Hanami2::Action::CookieJar)
  Hanami2::Action::CookieJar.class_eval do
    def include?(hash)
      key, value = *hash
      @cookies[key] == value
    end
  end
end
