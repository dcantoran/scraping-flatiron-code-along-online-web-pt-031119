require 'nokogiri'
require 'open-uri'

require_relative './course.rb'
require 'pry'
class Scraper
  
    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
  def get_page 
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    @flatiron = Nokogiri::HTML(html)
    @flatiron
    
    # @flatiron.css(".post").each do |post|
    #   course = Course.new 
    #   course.title = post.css("h2").text
    #   course.schedule = post.css(".date").text 
    #   course.description = post.css("p").text 
    # end 
  end 
  
  def get_courses
    @flatiron.css(".post")
  end 
  
end



