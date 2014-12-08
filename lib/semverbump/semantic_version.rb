module SemVerBump
  class SemanticVersion
    attr_reader :major
    attr_reader :minor
    attr_reader :patch
    attr_reader :pre_release
    attr_reader :build_metadata
    
    SEMANTIC_VERSION_PATTERN = /\A(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)(?:\-(?<pre_release>[0-9A-Za-z\-\.]+))?(?:\+(?<build_metadata>[0-9A-Za-z\-\.]+))?\Z/
    
    # FIXME: (me@lxcid.com) Does not satify "MUST NOT contain leading zeroes" requirement.
    def initialize(semver: nil, major: nil, minor: nil, patch: nil, pre_release: nil, build_metadata: nil)
      if semver
        m = semver.match(SEMANTIC_VERSION_PATTERN)
        raise ArgumentError.new("Invalid semantic version.") unless m
        @major = m['major'].to_i
        @minor = m['minor'].to_i
        @patch = m['patch'].to_i
        @pre_release = m['pre_release']
        @build_metadata = m['build_metadata']
      elsif major && minor && patch
        @major = major.to_i
        @minor = minor.to_i
        @patch = patch.to_i
        @pre_release = pre_release
        @build_metadata = build_metadata
      else
        raise ArgumentError.new("Invalid Arguments.")
      end
    end
    
    def to_s
      version_string = "#{@major}.#{@minor}.#{@patch}"
      version_string = version_string.concat("-#{@pre_release}") if @pre_release
      version_string = version_string.concat("+#{@build_metadata}") if @build_metadata
      version_string
    end
    
    def next_major_version
      SemanticVersion.new(major: @major + 1, minor: 0, patch: 0, pre_release: nil, build_metadata: nil)
    end
    
    def next_minor_version
      SemanticVersion.new(major: @major, minor: @minor + 1, patch: 0, pre_release: nil, build_metadata: nil)
    end
    
    def next_patch_version
      SemanticVersion.new(major: @major, minor: @minor, patch: @patch + 1, pre_release: nil, build_metadata: nil)
    end
  end
end
