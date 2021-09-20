require "selenium-webdriver"
require 'rubygems'
require 'chromedriver-helper'

driver = Selenium::WebDriver.for :chrome

#navigate to the page 
driver.navigate.to "https://kitchen.applitools.com/"

describe "Alert Automation " do
    driver.get "https://kitchen.applitools.com/ingredients/alert"
    it "Triggers an alertfrom a web based pop up" do
        driver.find_element(:id, 'alert-button').click
        # Store the alert reference in a variable
        alert = driver.switch_to.alert
        sleep 3
        alert_text = alert.text
        alert.accept
        sleep 3
    end

    it "Triggers a confirmation and accepts" do
        driver.find_element(:id, 'confirm-button').click
        # Store the alert reference in a variable
        alert = driver.switch_to.alert
        sleep 3
        alert_text = alert.text
        alert.accept
        sleep 3
    end

    it "Triggers a confirmation and dismisses" do
        driver.find_element(:id, 'confirm-button').click
        # Store the alert reference in a variable
        alert = driver.switch_to.alert
        sleep 3
        alert_text = alert.text
        alert.dismiss
        sleep 3
    end

    # Cases for prompt
    it "Triggers a prompt and enters a value" do
        driver.find_element(:id, 'prompt-button').click
        alert = driver.switch_to.alert
        alert.send_keys("My favourite food is Potato LUL")
        sleep 3
        alert.accept
    end

    it "Triggers a prompt and clicks ok without entering value" do
        driver.find_element(:id, 'prompt-button').click
        sleep 3
        alert = driver.switch_to.alert
        alert.accept
    end

    it "Triggers a prompt and enters a value and dismisses" do
        driver.find_element(:id, 'prompt-button').click
        alert = driver.switch_to.alert
        alert.send_keys("My favourite food is Potato LUL")
        sleep 3
        alert.dismiss
        sleep 3
    end

    it "Triggers a prompt and dismisses" do
        driver.find_element(:id, 'prompt-button').click
        alert = driver.switch_to.alert
        sleep 3
        alert.dismiss
    end

    it "Takes to MyKitchen HomePage" do
        driver.navigate.to "https://kitchen.applitools.com/"
        sleep 2
    end
end