class VersionFilter
  def filter(versions, conditions)
    requirement = Gem::Requirement.new(conditions)
    version_hash = {}
    versions.each do |version|
      gem_version = Gem::Version.new(version)
      version_hash[version] = requirement.satisfied_by?(gem_version)
    end
    version_hash
  end
end
