def full_url(relative_path)
  url = ENV['PERFORMANCE_ROOT'] + relative_path
  puts "Visiting #{url}"
  return url  
end
