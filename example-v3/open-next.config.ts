const config = {
  default: {
    override: {
      wrapper: "aws-lambda-streaming",
      queue: "sqs-lite",
      incrementalCache: "s3-lite",
      tagCache: "dynamodb-lite",
    },
  },
  functions: {},
  buildCommand: "yarn build",
};

export default config;
