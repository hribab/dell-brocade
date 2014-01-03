require 'rspec-puppet'

module_path = File.expand_path(File.join(File.dirname(__FILE__), '..'))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..','lib'))

RSpec.configure do |c|
  c.module_path = module_path
  c.manifest_dir = File.join(module_path, 'manifests')
    
  if Puppet::Util::Platform.windows?
    c.output_stream = $stdout
    c.error_stream = $stderr

    c.formatters.each do |f|
      if not f.instance_variable_get(:@output).kind_of?(::File)
        f.instance_variable_set(:@output, $stdout)
      end
    end
  end
end
