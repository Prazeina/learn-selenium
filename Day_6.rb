require "selenium-webdriver"
require "rspec"
require "chromedriver-helper"

driver = Selenium::WebDriver.for :chrome

# I cannot provide website URL here so just a code that worked for me thanks.

describe "Editing text field" do
    it "Edits text field of XYZ website" do
        # Make sure the text field is already filled
        driver.get "URL" #Sorry ><
        sleep 5
        driver.find_element(id: 'formName').clear
        driver.find_element(id: 'formName').send_keys('Doraemon')
        driver.find_element(id: 'formAlias').clear
        driver.find_element(id: 'formAlias').send_keys('Dora')
        driver.find_element(css: '.mx-0.btn.btn-primary').click
        driver.navigate.to "URL1"
        sleep 2
    end
end
