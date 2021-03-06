require 'pry'

class Landmarks::CLI

  def call
    puts ""
    puts "WELCOME TO TOP 20 ST. PETERSBURG ARCHITECTURAL LANDMARKS!"
    @scraper = Landmarks::Scraper.new
    @scraper.print_the_title
    @scraper.scrape_landmarks_index
    puts ""
    print_landmarks_index
    puts ""
    start
  end

  def start
    puts "Please enter the number of the landmark you would like more information on:"
    input = gets.chomp.to_i
    if input.between?(1, 20)

      landmark = Landmarks::Landmark.find(input)
      # @scraper.scrape_additional_details(landmark)
      puts "\t\n"
      puts landmark.name.strip.upcase
      puts "\t\n"
      puts "\t\t\t\t\t\t================== Description of the Landmark =================="
      puts "\t\n"
      puts landmark.description
      puts "\t\n"
      puts "\t\t\t\t\t\t================================================================="
      puts "\t\n"
      puts "Would you like to check the availability of directions, contact information and business hours? y/n"
      answer = gets.chomp.downcase

      if answer == "y"
        puts "\t\n"
        puts "\t\t\t\t\t\t====== Directions, contact information and business hours ======"
        puts "\t\n"
        puts landmark.directions
        puts "\t\n"
        puts "\t\t\t\t\t\t================================================================="
        puts "\t\n"
        puts "Would you like to find out more about another landmark? y/n"
        response = gets.chomp.downcase

        if response == "y"
          start
        else
          puts "\t\n"
          puts "Thank you for your interest! Have a great day, and welcome again in the future!"
          puts "\t\n"
          puts "\t\t\t**************************"
          puts "\t\n"
        end

      else
        puts "\t\n"
        puts "Would you like to find out more about another landmark? y/n"
        response = gets.chomp.downcase
        if response == "y"
          start
        else
          puts "Thank you for your interest! Have a great day, and welcome again in the future!"
          puts "\t\n"
          puts "\t\t\t**************************"
          puts "\t\n"
        end
      end
    else
      puts "Please enter a number from 1 to 20!"
      start
    end
  end

  def print_landmarks_index
    Landmarks::Landmark.all.each.with_index do |el, index|
      if el.name.include?("\r\n")
        puts "#{index+1}.#{el.name}".gsub("\r\n", "")
      else
        puts "#{index+1}.\t#{el.name}"
      end
    end
    nil
  end

end
