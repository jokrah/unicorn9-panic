module.exports = {
  configureWebpack: {
    mode: "development",
    module: {
      rules: [
        {
          test: /\.coffee$/,
          use: ["coffee-loader"]
        }
      ]
    }
  }
};