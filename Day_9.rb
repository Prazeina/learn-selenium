require "selenium-webdriver"
require "rubygems"
require "chromedriver-helper"

# You can change the dimensions as you wish
width = 1024
height = 728
driver = Selenium::WebDriver.for :chrome

describe "Take Screenshot" do
    it 'Takes screenshot of the provided URL' do
        driver.navigate.to "https://c4.wallpaperflare.com/wallpaper/617/713/266/tokyo-revengers-manga-hd-wallpaper-preview.jpg"

        driver.execute_script %Q{
            window.resizeTo(#{width}, #{height})
        }

        driver.save_screenshot('/tmp/Tokyo_Revengers.png')
    end
end
