require "aws-sdk-s3"

client = Aws::S3::Client.new(
  access_key_id:     "AKIAJG6YBYF4A35XMNWA",
  secret_access_key: "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",
  region:            "us-east-1",
)

client.put_bucket_cors(
  bucket: "heliumqa-development-bjarki",
  cors_configuration: {
    cors_rules: [{
      allowed_headers: ["Authorization", "Content-Type", "Origin"],
      allowed_methods: ["GET", "POST", "PUT"],
      allowed_origins: ["*"],
      max_age_seconds: 3000,
    }]
  }
)
