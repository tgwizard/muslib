class HelperLibrary
  def self.generate_slug(source)
    source.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end
end
