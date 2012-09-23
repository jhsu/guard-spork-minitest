class Spork::TestFramework::MiniTest < Spork::TestFramework
  DEFAULT_PORT = 8988
  UNIT_HELPER = File.join(Dir.pwd, "test/test_helper.rb")
  SPEC_HELPER = File.join(Dir.pwd, "spec/minitest_helper.rb")

  if defined?(Minitest::Spec) && File.exists?(SPEC_HELPER)
    HELPER_FILE = SPEC_HELPER
    TEST_PATH = "spec"
  else
    HELPER_FILE = UNIT_HELPER
    TEST_PATH = "test"
  end
  # HELPER_FILE = HELPER_FILES.detect {|f| File.exists?(f) }

  def run_tests(argv, stderr, stdout)
    ::MiniTest::Unit.output = stdout
    $LOAD_PATH << "." << TEST_PATH

    paths, opts = parse_options(argv)

    paths.each do |path|
      require path
    end

    ::MiniTest::Unit.new.run(opts)
  end

  def parse_options(argv)
    test_path = File.dirname(HELPER_FILE).split("/").last
    paths = argv.select {|arg|
      # break if arg =~ /^--/
      arg =~ /(^|\.\/)#{test_path}\//
    }
    opts = handle_flags(argv)

    [paths, opts]
  end

  protected

  # parses flags and handles them
  # * -I - adds to load path
  # * -r - requires file
  # * -e - evaluates string
  #
  # @param [Array] list of ARGV
  # @return [Array] args without known flags
  def handle_flags(args)
    unknown = []
    args.each_with_index do |item, index|
      case item
      when /^-I(.*)/
        path = $1
        path = path != "" ? path : args[index+1]
        $LOAD_PATH << path
      when /^-r(.*)/
        path = $1
        path = path != "" ? path : args[index+1]
        require path
      when /^-e(.*)/
        command = $1
        command = command != "" ? command : args[index+1]
        eval command
      when /^-{1,2}\w+/
        option = args[index+1]
        unknown << option unless option =~ /^-/
        unknown << item << option
      end
    end
    unknown.compact
  end

end
