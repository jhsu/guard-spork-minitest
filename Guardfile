guard 'minitest' do
  # with Minitest::Unit
  watch(%r|^test/(.*)\/?test_(.*)\.rb|)
  # watch(%r|^lib/(.*)([^/]+)\.rb|)     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  watch(%r|^test/test_helper\.rb|)    { "test" }

  # with Minitest::Spec
  watch(%r|^spec/(.*)_spec\.rb|)
  # watch(%r|^lib/(.*)([^/]+)\.rb|)     { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r|^spec/spec_helper\.rb|)    { "spec" }
end


guard 'spork', :cucumber => false, :test_unit => false, :rspec => false, :minitest => true do
  watch('spec/spec_helper.rb') { :minitest }
  watch('test/test_helper.rb') { :minitest }
end
