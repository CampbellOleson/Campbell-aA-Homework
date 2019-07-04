const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const prompt = function() { reader.question("Enter a number:", function (input) {
    const num = parseInt(input);
    this.sum = num + this.sum;
    console.log(sum);
    addNumbers(sum, numsLeft - 1, completionCallback);
        }
    )
};

const addNumbers = function (sum, numsLeft, completionCallback) {
    this.sum = sum;
    this.numsLeft = numsLeft;
    if (this.numsLeft === 0) {
        completionCallback(this.sum);
        reader.close();
        return ;
    }
    prompt.bind(this)();
}


const completionCallback = function() {
    console.log(`Total Sum: ${sum}`)
}

addNumbers(0, 3, completionCallback);
