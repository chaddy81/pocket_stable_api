CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      # :aws_access_key_id      => ENV['S3_KEY'],
      :aws_access_key_id      => 'AKIAIQDYDJUZSSI7WCBQ',
      # :aws_secret_access_key  => ENV['S3_SECRET']
      :aws_secret_access_key  => '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'
      # :region                 => ENV['S3_REGION'] # Change this for different AWS region. Default is 'us-east-1'
  }
  # config.fog_directory  = ENV['S3_BUCKET']
  config.fog_directory  = 'pocket-stable'
end