require 'watir'

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new :chrome
  @browser.driver.manage.window.maximize
end


After do
  @browser.close
end

After do |scenario|
  SCREENSHOTS_DIRECTORY = "html_report"
  if scenario.failed?
    time_stamp = Time.now.to_s.gsub('-','_').gsub(' ','_').gsub(':','_').gsub(/__0400/,'')
    screenshort = "#{scenario.name.gsub(' ','_')}_#{time_stamp}.png"
    @browser.driver.save_screenshot(File.join(SCREENSHOTS_DIRECTORY,screenshort))
    embed(File.join(SCREENSHOTS_DIRECTORY,screenshort),"image/png","SCREENSHOT")
  end
end