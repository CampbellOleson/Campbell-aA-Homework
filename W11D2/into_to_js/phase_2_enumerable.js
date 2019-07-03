Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i]); 
    }
};

function mult(num) {
    return (num * 2);
};

// [1,3,4,5,2].myEach(mult)

Array.prototype.myMap = function(callback) {
    let newArr = []
    function scooper(el) {
        newArr.push(callback(el)); //undefined
    } 
    this.myEach(scooper);
    return newArr;
};

// Array.prototype.myMap = function (callback) {
//     let newArr = [];
//     newArr.push(this.myEach(callback));
//     return newArr;
// };

// console.log([1, 3, 4, 5, 2].myMap(mult));

Array.prototype.myReduce = function(callback,initialValue) {
    let init = initialValue || this[0];
    let i;
    if (!initialValue) {
        i = 1;
    } else {
        i = 0;
    }
    while (i < this.length) {
        init += this[i];
        i += 1;
    }
    return init;
}

function mult(num) {
    return (num * 2);
};

// console.log([1, 3, 4, 5, 2].myReduce(mult,10));

function swap(arr,i1,i2) {
    let oldie = arr[i1];
    arr[i1] = arr[i2];
    arr[i2] = oldie;
}

Array.prototype.myBubbleSort = function() {
    let sorted = false;
    while (!sorted) {
        sorted = true;
        for(let i = 0; i < this.length - 1; i++) {
            if (this[i] > this[i+1]) {
                swap(this, i, i+1);
                sorted = false;
            }
        }
    }
    return this;
}

// console.log([1,2,6,3,2,8,1,2,0,52,4,6].myBubbleSort())

String.prototype.mySubStrings = function() {
    let subs = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = i; j < this.length; j++) {
                subs.push(this.slice(i, j+1))
        }
    }
    return subs;
}

// console.log("campbell".mySubStrings());

