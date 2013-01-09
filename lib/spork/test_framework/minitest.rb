class Spork::TestFramework::MiniTest < Spork::TestFramework
  DEFAULT_PORT = 8988
  TEST_PATH = ["test", "spec"].detect {|dir| File.exists?(File.join(Dir.pwd, dir)) }
  HELPER_FILE = File.expand_path(File.join(TEST_PATH, ["minitest_helper.rb", "test_helper.rb", "spec_helper.rb"].detect {|file|
    File.exists?(File.join(Dir.pwd, TEST_PATH, file))
  }))

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
    paths = argv.select {|arg|
      # break if arg =~ /^--/
      arg =~ /(^|\.\/)#{TEST_PATH}\//
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
