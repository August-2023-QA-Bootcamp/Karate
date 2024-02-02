Feature: UI Automation

  Background: 
    * def locator = read('classpath:util_files/locator.json')
    * def constant = read('classpath:util_files/constant.json')
    * def test_data = read('classpath:data/test_data.json')

  @chrome
  Scenario Outline: Auto Quote - Chrome
    * configure driver = {type : <driver>, addOptions: ["--remote-allow-origins=*"]}
    * driver 'https://www.geico.com/'
    #* driver uiUrl
    * maximize()
    * def mainTitle = text(locator.main_title)
    * match mainTitle == constant.main_title
    * match driver.title == constant.title
    * waitFor(locator.zip)
    #* script('#ssp-service-zip','function(e){e.scrollIntoView(true)}')
    * input(locator.zip,<zip>)
    * click(locator.auto_lob)
    * scroll(locator.go_btn).click()
    * click(locator.start_my_quote_btn)
    * delay(5000)

    Examples: 
      | driver   | zip                                |
      | null     | test_data.zip.manhattan[1]         |
      | 'msedge' | test_data.zip.richmond_hill_ny_zip |

  @msedge
  Scenario: Auto Quote - MSEDGE
    * configure driver = { type: 'msedge', addOptions: ["--remote-allow-origins=*"] }
    Given driver 'https://www.connectbyamfam.com/'
    And delay(2000)

  @firefox
  Scenario: Auto Quote - firefox
    * configure driver = { type: 'geckodriver', executable: 'true' }
    Given driver 'https://www.connectbyamfam.com/'
    And delay(2000)
