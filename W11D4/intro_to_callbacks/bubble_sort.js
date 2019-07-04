const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

const absurdBubbleSort = function (arr, sortCompletionCallback) {

    function outerBubbleSortLoop (madeAnySwaps) {
        if (madeAnySwaps) {
            innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
        } else {
            sortCompletionCallback(arr);
        }
    };
    outerBubbleSortLoop(true);
};

const askIfGreaterThan = function (el1, el2, callback) { 
    reader.question(`${el1} > ${el2} ?`, function (input) {
        switch (input) {
            case "yes" :
                console.log(true);
                callback(true);
            case "no" :
                console.log(false);
                callback(false);
        }
    }) 
};

const innerBubbleSortLoop = function (arr, i, madeAnySwaps, outerBubbleSortLoop) {
    console.log("in inner");
    for ( ; i < arr.length - 1; i++ ) {
        askIfGreaterThan(arr[i], arr[i+1], function (boolean) { 
            if (boolean) {
                let el1 = arr[i];
                arr[i] = arr[i+1];
                arr[i+1] = el1;
            }
            reader.close()
            innerBubbleSortLoop(arr, i+1, true, outerBubbleSortLoop(madeAnySwaps));
        });
    }
    outerBubbleSortLoop(madeAnySwaps);
};

absurdBubbleSort([3, 2, 1], function (arr) {
    console.log("Sorted array: " + JSON.stringify(arr));
    reader.close();
});

// askIfGreaterThan(1, 3, function (boolean) {
//     if (boolean) {
//         // let el1 = arr[i];
//         // arr[i] = arr[i + 1];
//         // arr[i + 1] = el1;
//         console.log(0);
//     }
// });