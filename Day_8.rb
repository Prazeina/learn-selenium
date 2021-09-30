require 'rubygems'
require 'selenium-webdriver'
require 'chromedriver-helper'

driver = Selenium::WebDriver.for :chrome

# navigate to page


describe "File Picker" do
    it "Uploads a picture" do
        driver.get 'https://kitchen.applitools.com/ingredients/file-picker'
        driver.find_element(:xpath, '//*[@id="photo-upload"]').send_keys "/home/prazeina/repos/prazeina/Selenium/Selenium/Baji.png"
        sleep 5
    end
end