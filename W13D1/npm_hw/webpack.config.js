const path = require("path");
// this is a js object that has some fancy methods defined on it we're just importing it like a ruby gem

module.exports = {
    entry: "./entry.jsx",
    // this is our file entry point that will access all of our app
    output: {
        path: path.resolve(__dirname, 'app', 'assets', 'javascripts'),
        //this creates a string poiting to the directorty where the bundle.js is housed
        // uses.resolve and __dirname methods that are part of the path object
        filename: "bundle.js"
        //this is our output file that compiles and gives our code
    },
    devtool: 'source-map',
    // this dev tool shows us line nums in our our source code
    resolve: {
        extensions: ['.js','.jsx','*']
    // these the extensions we gon have to fuck wit
    // star is there to allow us to use explicit file extensions
    },
    // we gonna resolve some shit
    module: {
        rules: [
            //some rules for something
            {
            test: [/\.jsx?$/],
                // when we test these jsx babies
            exclude: /(node_modules)/,
            // exclude this huge package from the test
            use: {
                loader: 'babel-loader',
                // this will comile everyhting into ecma 5 so those lame hoes can use it 
                query: {
                presets: ['@babel/env','@babel/react']
                }
                // some more specific presets to babel
            },
            }
        ]
        // g wtaf is these rules?
    }
    // wtaf is this module shit? idk
}