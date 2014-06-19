require File.dirname(__FILE__) + '/spec_helper'

class Node < ActiveRecord::Base
  acts_as_tree  # need this
  acts_as_breadcrumbs
end

class Location < ActiveRecord::Base
  acts_as_tree  # need this
  acts_as_breadcrumbs(:attr => :location_string)
end

class Soldier < ActiveRecord::Base
  acts_as_tree  # need this
  acts_as_breadcrumbs(:attr => :chain_o_command, :separator => " > ", :include_root => false)
end

class WebPage < ActiveRecord::Base
  acts_as_tree  # need this
  acts_as_breadcrumbs(:attr => :url, :basename => :slug, :separator => "/")
  acts_as_breadcrumbs(:basename => :title, :separator => "&nbsp;&gt;&nbsp;")
end

describe ActiveRecord::Acts::Breadcrumbs do
  fixtures :nodes, :locations, :soldiers, :web_pages

  it "should work with no options" do
    nodes(:node_3).save
    assert_equal "Root:Level 1:Level 2", nodes(:node_3).breadcrumbs
  end

  it "should use an alternate attribute" do
    locations(:location_3).save
    assert_equal "HQ:FL01:RM03", locations(:location_3).location_string
  end

  it "should include the specified basename" do
    web_pages(:web_page_3).save
    assert_equal "foo/bar/baz", web_pages(:web_page_3).url
  end

  it "should include the specified separator" do
    soldiers(:soldier_4).save
    assert_equal "General Hailstone > Colonel Stanley > LTC Mueller", soldiers(:soldier_4).chain_o_command
  end

  it "should include the root" do
    locations(:location_1).save
    assert_equal "HQ", locations(:location_1).location_string
  end

  it "should not include the root" do
    soldiers(:soldier_1).save
    assert_equal "", soldiers(:soldier_1).chain_o_command
  end

  it "should create two breadcrumbs" do
    web_pages(:web_page_3).save
    assert_equal "foo/bar/baz", web_pages(:web_page_3).url
    assert_equal "Foo&nbsp;&gt;&nbsp;Bar&nbsp;&gt;&nbsp;Baz", web_pages(:web_page_3).breadcrumbs
  end
end
