# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Challenge.destroy_all

challenge_arr = ['Create an app using CSS grid','Create an app that authenticates users', 'Create a React frontend for an API you find online', 'Create a full Rails app', 'Create an app that is accessible', 'Rebuild your old MySpace page from scratch', 'Create a Ruby Gem', 'Create an app that is responsive to screen size', 'Create an app for an elderly audience', 'Build your own social media app', 'Build your own Instagram', 'Build a personal website', 'Deploy an app you are proud of to Heroku', 'Create a React app that utilizes new HTML 5 features', 'Build an app with at least one other person','Write the best ever Read Me for an old or new project', 'Create a browser game', 'Build an app that uses as many event handlers as possible','Build an app using jQuery', 'Create an app with custom errors', 'Build a single page app', 'Create an ecommerce app', 'Create an app with a Postgresql Database', 'Write tests for an old or new project', 'Create a Chrome extension', 'Build a project with 4 backend associated models', 'Create an app that utilizes sessions', 'Build an app that relies on machine learning', 'Create an app that would have been useful to you at another stage of life', 'Create a Rails backend, React frontend app', 'Create a new shortcut for your terminal', 'Build a project where elements have more than one event listener', 'Build an app that uses cookies', 'Build a fan site', 'Create an app that utilizes GoogleMaps', 'Refactor a project you wrote months ago', 'Create an app that validates input, with at least one custom validation', 'Build an app that utilizes intervals', 'Contribute to an open source project', 'Create an app that has imbedded videos']

challenge_arr.each do |chall|
  Challenge.create(content: chall, rating: rand(1...10), links: 'https://developer.mozilla.org/en-US/docs/Web, https://developer.mozilla.org/en-US/docs/Web, https://developer.mozilla.org/en-US/docs/Web')
end
