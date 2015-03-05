# -*- encoding: utf-8 -*-
# stub: acts_as_tree 2.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "acts_as_tree"
  s.version = "2.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Erik Dahlstrand", "Rails Core", "Mark Turner", "Swanand Pagnis", "Felix B\u{fc}nemann"]
  s.date = "2014-09-25"
  s.description = "A gem that adds simple support for organizing ActiveRecord models into parent\u{2013}children relationships."
  s.email = ["erik.dahlstrand@gmail.com", "mark@amerine.net", "swanand.pagnis@gmail.com", "felix.buenemann@gmail.com"]
  s.homepage = "https://github.com/amerine/acts_as_tree"
  s.rdoc_options = ["--charset=UTF-8"]
  s.rubygems_version = "2.2.0"
  s.summary = "Provides a simple tree behaviour to active_record models."

  s.installed_by_version = "2.2.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, [">= 0"])
      s.add_development_dependency(%q<minitest>, ["~> 4.7.5"])
    else
      s.add_dependency(%q<activerecord>, [">= 3.0.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<rdoc>, [">= 0"])
      s.add_dependency(%q<minitest>, ["~> 4.7.5"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 3.0.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<rdoc>, [">= 0"])
    s.add_dependency(%q<minitest>, ["~> 4.7.5"])
  end
end
