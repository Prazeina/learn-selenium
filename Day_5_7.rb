require "selenium-webdriver"
require "chromedriver-helper"
require "rubygems"

driver = Selenium::WebDriver.for :chrome

driver.get "https://kitchen.applitools.com/"

describe "Canvas testing using selenium with rspec" do
    driver.get "https://kitchen.applitools.com/ingredients/canvas"
    it "Interacts with canvas" do
        canvas = driver.find_element(:id, "burger_canvas")
        # Calculate canvase dimension
        width = 600
        height = 400

        # canvasWidth = canvas.width
        # canvasHeight = $canvas.height

        # Divide to align cursor in center
        canvasCenterX = width / 2
        canvasCenterY = height / 2

        # Test to work responsively
        buttonX = canvasCenterX + (( canvasCenterX / 3) * 2)
        buttonY = canvasCenterY + (( canvasCenterY / 3) * 2)

        # Click button on canvas
        # Probably need to add scroll window
        driver.click($buttonX, $buttonY)
           
        #Verify canvas now displays burger
        driver.eyesOpen({ testName: 'Burger on Canvas' });
        driver.eyesCheckWindow();
        driver.eyesClose();
    end
end
