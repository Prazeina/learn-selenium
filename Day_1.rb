require 'rubygems'
require 'selenium-webdriver'
require 'chromedriver-helper'

$feedback = "Yaho it is nice"
# object for chrome
driver = Selenium::WebDriver.for :chrome

#navigate to the index.html
driver.navigate.to "/home/prazeina/repos/prazeina/Selenium/Selenium/index.html"

if driver.find_element(:class, 'genre').displayed?
    driver.find_element(:class, 'genre').click
    puts "The genre is selected"
else
    puts "The genre is not selected"
end
sleep 4

if driver.find_element(:id, 'dropdown').displayed?
    input = driver.find_element(:tag_name, 'input')
    input.each do |i|
        if (i.text == 'Mahou') 
            i.click
            break
        end
    end
else
    puts "The dropdown is not selected"
end
sleep 4

# Chekcing the checkbox
if driver.find_element(:id, 'completed').displayed?
    driver.find_element(:id, 'completed').click
    puts "The list of anime is displayed"
else
    puts "The list of anime is not displayed"
end
sleep 4

#Write the feedback
if driver.find_element(:xpath, '/html/body/input[1]').displayed?
    driver.find_element(:xpath, '/html/body/input[1]').send_keys($feedback)
    puts "Feedback has been sent"
else
    puts "Feedback is not sent"
end
sleep 4

#Submit everything
driver.find_element(:id, 'submit').click
sleep 4

#click on search link
if driver.find_element(:link_text, 'Shoujo Anime List').displayed?
    driver.find_element(:css, 'Shoujo Anime List').send_keys 'It is nice YAHO'
    puts "Shoujo Anime is displayed"
else
    puts "Shoujo Anime is not displayed"
end
sleep 4