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

#click on login creating a method
def login_button(driver)
    driver.find_element(:xpath, '/html/body/header/div[1]/div/div/div[2]/div/div/a[2]').click
    driver.navigate.to "https://www.phptravels.net/login"
end

#Method for sign up
def signup_credential(driver)
    driver.find_element(:css, '.btn.btn-outline-primary.btn-block.form-group.effect.ladda-sm.ladda-button.waves-effect').click
    driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[2]/div/form/div[1]/div/input').send_keys($firstname)
    driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[2]/div/form/div[2]/div/input').send_keys($lastname)
    driver.find_element(:css, '.la.la-phone.form-icon').send_keys($phone)
    driver.find_element(:tag_name, 'input').send_keys($email)
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
        sleep 3
    end
end

#Sign Up the new user
describe "Automating a Sign Up Form" do
    it "Signs up a user" do
        login_button(driver)
        signup_credential(driver)
        driver.find_element(:xpath, '/html/body/div[1]/div/div[2]/div[2]/div/form/div[5]/div/input').send_keys($password)
        driver.find_element(:xpath, '//*[@id="select2-account_type-container"]').click
        driver.find_element(:css, '.btn.btn-default.btn-lg.btn-block.effect.ladda-button.waves-effect').click
        driver.navigate.to "https://www.phptravels.net/login/signup"
        driver.find_element(:css, 'alert alert-success signup')
        sleep 3
    end
end