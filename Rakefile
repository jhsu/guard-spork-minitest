require 'rake/testtask'

Rake::TestTask.new do |t|
  t.name = "test"
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
 end

Rake::TestTask.new do |t|
  t.name = "spec"
  t.libs << "spec"
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end
