# URLockBox

Visit the production instance [here](https://calm-fjord-11043.herokuapp.com/links)

URLockBox is an app that keeps track of urls you'd like to read. You're able to enter urls in a form that checks url validity, and read/unread a given url. When a url is read the app sends a record of the read to the secondary app Hotreads (more info below).  looks at all the reads across all users and displays the top ten. URLockBox consumes this information from an api call and applies styling to the reads of a particular user if they are within those top ten.

### Setup

Please follow these steps:

1. Clone the project<br>
`git clone git@github.com:lsaville/final_assessment_urlockbox.git`<br>

2. Get the dependencies<br>
`bundle install`<br>

3. Start the server<br>
`rails s`<br>

### It's relationship to Hotreads

URLockbox maintains a tight relationship with Hotreads found in [production](https://sheltered-springs-63378.herokuapp.com/) and on [Github](https://github.com/lsaville/final_hot_reads). If you want to run the apps locally you'll have to change the urls located in `app/assets/javascripts/determine_hotreads.js.es6` line: 6 and `app/assets/javascripts/mark-read.js.es6` line: 41 to point to localhost:8080 (assuming you plan on running Hotreads on unicorn as described in it's [set up](https://github.com/lsaville/final_hot_reads))

### Testing with PhantomJS using poltergeist

The app has phantom.js, a headless webdriver installed for JS testing. Normal rspec testing is used unless you specify the form
```ruby
describe 'some functionality', js: true do
end
```
in which case the test uses the headless browser. Documentation for poltergeist and some cool capabilities like `page.save_screenshot` can be found [here](https://github.com/teampoltergeist/poltergeist).

Tests are run using `rspec`

## Thanks!
