desc "Deploy to Heroku then push to Github"
task :deploy do
  puts "Pusing to Heroku with 'git push heroku master'"
  `git push heroku master`

  puts "Pushing to Github with 'git push origin master'"
  `git push origin master`
end