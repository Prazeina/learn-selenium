# Selenium with Rspec
require 'selenium-webdriver'
require 'rubygems'
require 'chromedriver-helper'

driver = Selenium::WebDriver.for :chrome

$email_login = 'user@phptravels.com'
$password_login = 'demouser'

#navigate to the page 
driver.navigate.to "https://www.phptravels.net/"

#click on login creating a method
def login_button(driver)
    driver.find_element(:xpath, '/html/body/header/div[1]/div/div/div[2]/div/div/a[2]').click
    driver.navigate.to "https://www.phptravels.net/login"
end

# Enter the credentials in form
describe "Automating a Login form" do
    it "submits a form" do
        login_button(driver)
        driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[2]/div/form/div[1]/div/input').send_keys($email_login)
        driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[2]/div/form/div[2]/div[1]/input').send_keys($password_login)
        sleep 2
        # driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[2]/div/form/div[2]/div[2]/div[1]/label').click
        driver.find_element(:css, '.btn.btn-default.btn-lg.btn-block.effect.ladda-button.waves-effect').click
        driver.navigate.to "https://www.phptravels.net/account/dashboard"
        driver.find_element(:class, '. waves-effect').click
        sleep 3
    end
end
