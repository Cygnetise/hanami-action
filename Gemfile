# frozen_string_literal: true

source "http://rubygems.org"

gemspec

unless ENV["CI"]
  gem "byebug", platforms: :mri
  gem "yard"
  gem "yard-junk"
end

gem "hanami-utils", github: "hanami/utils", tag: "v2.2.0"

group :validations do
  gem "hanami-validations", github: "hanami/validations", tag: "v2.2.0"
end

group :test do
#  gem "dry-files", github: "dry-rb/dry-files", branch: "main"

  gem "hanami-router", github: "hanami/router", tag: "v2.2.0"
  gem "hanami-cli",  github: "hanami/cli", tag: "v2.2.0"
  gem "hanami-view", github: "hanami/view", tag: "v2.2.0"
  gem "hanami",      github: "hanami/hanami", tag: "v2.2.0"
  gem "slim"
end

group :benchmarks do
  gem "benchmark-memory"
  gem "memory_profiler"
end

gem "hanami-devtools", github: "hanami/devtools", branch: "main"
