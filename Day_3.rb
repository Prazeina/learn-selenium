# Selenium with Rspec
require 'selenium-webdriver'
require 'rubygems'
require 'chromedriver-helper'

driver = Selenium::WebDriver.for :chrome

$email_login = 'user@phptravels.com'
$password_login = 'demouser'

#navigate to the page 
driver.navigate.to "https://www.phptravels.net/"

#Data required for sign up using global variables
$firstname = 'Prajeena'
$lastname = 'Maharjan'
$phone = '1234567890'
$email = 'hello@gamil.com'
$password = 'password'
   
#Method for sign up
def signup_credential(driver)
    driver.find_element(:css, '.theme-btn.theme-btn-small.waves-effect').click
    driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[2]/div/form/div[1]/div/input').send_keys($firstname)
    driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[2]/div/form/div[2]/div/input').send_keys($lastname)
    driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[2]/div/form/div[3]/div/input').send_keys($phone)
    driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[2]/div/form/div[3]/div/input').send_keys($email)
end

#Sign Up the new user
describe "Automating a Sign Up Form" do
    it "Signs up a user" do
        driver.find_element(:xpath, '/html/body/header/div[1]/div/div/div[2]/div/div/a[2]').click
        driver.navigate.to "https://www.phptravels.net/login"

        signup_credential(driver)

        driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[2]/div/form/div[5]/div/input').send_keys($password)
        # I don't know why this is not functioning :sobpepe:
        driver.find_element(:css, 'span[title="Customer"]').click
        driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[2]/div/form/div[7]/button').click
        sleep 3
    end
end