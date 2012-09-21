class Spork::TestFramework::MiniTest < Spork::TestFramework
  DEFAULT_PORT = 8988
  HELPER_FILES = [ File.join(Dir.pwd, "test/test_helper.rb"),
                   File.join(Dir.pwd, "spec/spec_helper.rb")]
  if defined?(Minitest::Spec)
    HELPER_FILE = HELPER_FILES.last
  else
    HELPER_FILE = HELPER_FILES.first
  end
  # HELPER_FILE = HELPER_FILES.detect {|f| File.exists?(f) }

  def run_tests(argv, stderr, stdout)
    ::MiniTest::Unit.output = stdout

    puts HELPER_FILE
    paths, opts = parse_options(argv)
    opts.size

    $LOAD_PATH << "."

    # autorun is needed for this
    paths.each do |path|
      require path
    end


    ::MiniTest::Unit.new.run()
  end

  def parse_options(argv)
    opts = []
    test_path = File.dirname(HELPER_FILE).split("/").last
    paths = argv.select {|arg|
      # break if arg =~ /^--/
      arg =~ /(^|\.\/)#{test_path}\//
    }
    handle_flags(argv)

    [paths, opts]
  end

  protected

  def handle_flags(args)
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
      end
    end
  end

end
