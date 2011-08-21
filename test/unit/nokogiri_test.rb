require 'nokogiri'
require 'test_helper'

class NokogiriTest < ActiveSupport::TestCase

  test "matching a single element" do
    
    html = '<table><tr><td class="foo">bar</td></tr></table>'
    doc = Nokogiri::HTML(html)
  
    assert_equal 'bar', doc.at_css('td.foo').content
  end

  test "matching a non-existing single element" do
    
    html = '<table><tr><td class="bar">foo</td></tr></table>'
    doc = Nokogiri::HTML(html)
  
    assert_nil doc.at_css('td.foo')
  end
  
  test "matching multiple elements" do
    html = '<table><tr><td class="foo">bar</td><td class="foo">baz</td><td>quux</td></tr></table>'
    doc = Nokogiri::HTML(html)
    cells = doc.css('td.foo')
    assert_equal 2, cells.size
      
    content_of_cells = cells.map { |td| td.content }
    assert content_of_cells.include? 'bar'
    assert content_of_cells.include? 'baz'
    assert !content_of_cells.include?('quux')
  end

end