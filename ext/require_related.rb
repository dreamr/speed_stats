def require_related_file(test_file)
  test_file_path = File.expand_path(test_file)
  # UGLY ass regex :(
  matching_file = test_file_path.
    match(/test\/(.*)\/([^\/]+)_test\.rb/)[1..2].join("/")
  if matching_file.nil?
    raise Exception.new("There is no corresponding file in lib!")
  end
  require File.expand_path("#{matching_file}.rb")
end
