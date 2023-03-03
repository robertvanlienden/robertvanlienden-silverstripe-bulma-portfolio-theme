const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const CssMinimizerPlugin = require("css-minimizer-webpack-plugin");
const FixStyleOnlyEntriesPlugin = require('webpack-fix-style-only-entries');
const ESLintPlugin = require('eslint-webpack-plugin');
const StylelintPlugin = require('stylelint-webpack-plugin');

module.exports = {
  devtool: process.env.NODE_ENV === 'dev' ? 'source-map' : false,
  mode: 'development',
  watchOptions: {
    ignored: /node_modules/,
  },
  entry: {
    app: './src/javascript/app.js',
    main: './src/sass/main.scss',
    editor: './src/sass/editor.scss',
  },
  optimization: {
    minimizer: [
      new CssMinimizerPlugin()
    ],
    splitChunks: {
      cacheGroups: {
        app: {
          name: 'app',
          test: /\.js$/,
          chunks: 'all',
          enforce: true,
        },
        main: {
          name: 'main',
          test: /main\.(sa|sc|c)ss$/,
          chunks: 'all',
          enforce: true,
        },
        editor: {
          name: 'editor',
          test: /editor\.(sa|sc|c)ss$/,
          chunks: 'all',
          enforce: true,
        },
      },
    },
  },
  output: {
    path: path.resolve(__dirname, './bundles'),
  },
  module: {
    rules: [
      {
        test: /\.(sa|sc|c)ss$/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
            options: {
              publicPath: '',
            },
          },
          {
            loader: 'css-loader',
            options: {
              sourceMap: true,
            }
          },
          {
            loader: 'sass-loader',
            options: {
              sourceMap: true,
              sassOptions: {
                outputStyle: "compressed"
              }
            }
          },
          {
            loader: 'postcss-loader',
          },
        ],
      },
        {
            test: /\.(woff)$/,
            use: [
                {
                    loader: 'file-loader',
                    options: {
                        type: 'asset/resource',
                    },
                },
            ],
        },
      {
        test: /\.m?js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env'],
            plugins: [
              '@babel/plugin-transform-runtime',
            ],
          },
        },
      },
    ],
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: ({ chunk }) => `${chunk.name.replace('/js/', '/css/')}.css`,
    }),
    new FixStyleOnlyEntriesPlugin(),
    new ESLintPlugin(),
    new StylelintPlugin(),
  ],
};
