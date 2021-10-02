require "selenium-webdriver"
require "rubygems"
require "chromedriver-helper"

driver = Selenium::WebDriver.for :chrome

describe 'Drag and Drop the items' do
    it "should drag and drop from list of items" do
        driver.get "https://kitchen.applitools.com/ingredients/drag-and-drop"
        # lets grab the element
        menu_list = driver.find_element(:id, "menu-fried-chicken")
        # lets frap droppable element
        plate_items = driver.find_element(:id, "plate-items")
        driver.action.click_and_hold(menu_list).move_to(plate_items).perform  
        driver.action.release.perform   
    end

    it "Should Drag and Drop one specific item" do
        driver.navigate.to "http://crossbrowsertesting.github.io/drag-and-drop.html"
        grab = driver.find_element(:id, "draggable")
        drop = driver.find_element(:id, "droppable")
        # lets grab the element
        driver.action.click_and_hold(grab).perform
        # lets drop the element
        driver.action.move_to(drop).perform
        driver.action.release.perform
    end

    it "Should Drag and Drop one specific item- Method 2" do
        driver.navigate.to "http://crossbrowsertesting.github.io/drag-and-drop.html"
        grab = driver.find_element(:id, "draggable")
        drop = driver.find_element(:id, "droppable")
        driver.action.drag_and_drop(grab, drop).perform
    end
end