# put code here that:

# takes an array of URLs as an argument (use splat for sure)
# navs to those URLs and clones the repos there
# puts cloned repos into our app's /curriculum dir
# need to be sure to remove the .git version control after cloning

class LabCloner
  attr_reader :urls

  def initialize(*urls)
    # need to pass multiple strings comma separated
    @urls = urls
  end

  def call
    # looping through urls + git cloning magic here
    self.urls.each do |url|
      if !File.exists?(File.join(RootFolder, '/curriculum'))
        Dir.mkdir(File.join(RootFolder, '/curriculum'))
      end
      Dir.chdir(File.join(RootFolder, '/curriculum'))

      # name = url.match(/\/([a-zA-Z-]*)(?=-ruby\b-\d{3})/)[1]
      name = url.match(/\/([a-zA-Z-]*)/)[1]
      if !Dir.glob(File.basename(File.join(Dir.pwd,"*"))).include?(name)
        system("git clone #{url} #{name}")
        system("rm -rf #{name}/.git")
        system("touch #{name}/url.txt")
        system("touch #{name}/repo_details.txt")
        system("echo #{url} > #{name}/url.txt")
      else
        system("echo #{name} already exists as a lab in this directory")
      end
    end
  end

end