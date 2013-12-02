# put code here that:

# takes an array of URLs as an argument (use splat for sure)
# navs to those URLs and clones the repos there
# puts cloned repos into our app's /curriculum dir
# need to be sure to remove the .git version control after cloning

class Cloner
  attr_reader :urls

  def initialize(*urls)
    # need to pass multiple strings comma separated
    @urls = urls
  end

  def call
    # looping through urls + git cloning magic here
    self.urls.each do |url|
      Dir.chdir(File.join(RootFolder, '/curriculum'))
      name = url.match(/\/(\w*-\w*)-\b/)[1]
      system("git clone #{url} #{name}")
      system("rm -rf #{name}/.git")
    end
  end

end