require 'optparse'

# Default configuration values
options = {
  access_key: nil,
  secret_key: nil,
  region: '',
  endpoint: 's3.amazonaws.com',
  endpoint_bucket: nil,
  use_https: 'False'
}


# Parse command-line arguments using OptionParser for flexibility
parser = OptionParser.new do |opts|
  opts.on("--access-key=[ACCESS_KEY]", "Access Key ID") do |key|
    options[:access_key] = key
  end
  opts.on("--secret-key=[SECRET_KEY]", "Secret Access Key") do |key|
    options[:secret_key] = key
  end
  opts.on("--region=[REGION]", "Region") do |region|
    options[:region] = region
  end
  opts.on("--endpoint=[ENDPOINT]", "Endpoint") do |endpoint|
    options[:endpoint] = endpoint
  end
  opts.on("--endpoint-bucket=[ENDPOINT_BUCKET]", "Endpoint for buckets") do |endpoint_bucket|
    options[:endpoint_bucket] = endpoint_bucket
  end
  opts.on("--use-https[=VALUE]", "Use HTTPS") do |use_https|
    options[:use_https] = use_https.nil? || use_https.empty? || use_https.casecmp('false').zero? ? 'False' : 'True'
  end  
end

parser.parse!

# Check for required values
if options[:access_key].nil? || options[:secret_key].nil?
  puts "Access Key and Secret Key are required."
  puts ""
  puts parser.help
  exit 1
end

# Generate .s3cfg content
s3cfg_content = <<-CONFIG
[default]
access_key=#{options[:access_key]}
secret_key=#{options[:secret_key]}
bucket_location=#{options[:region]}
host_base=#{options[:endpoint]}
host_bucket=#{options[:endpoint_bucket].nil? ? "%(bucket)s.#{options[:endpoint]}" : options[:endpoint_bucket]}
use_https=#{options[:use_https]}
CONFIG

# Save .s3cfg file
File.write(File.expand_path('~/.s3cfg'), s3cfg_content)

puts "Configuration saved to ~/.s3cfg"