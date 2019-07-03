// Array.prototype.myUniq = function () {
//     let newArr = [];
  
//     for (let i = 0; i < this.length; i++) {
//         let el = this[i];
//         if (!newArr.includes(el)) { 
//             newArr.push(el);
//         }
//     }
//    return newArr;
// };

// console.log([1,2,3,-3,4,5,2,3,2].myUniq());

// Array.prototype.twoSum = function () {
//     let newArr = [];
//     for (let i = 0; i < this.length; i++) {
//         for (let j = (i + 1); j < this.length; j++) {
//             if ((this[i] + this[j]) === 0) {
//                 newArr.push([this[i], this[j]]);
//             }
//         }
//     }
//     return newArr;
// }

// console.log([1,2,3,-3,4,5,2,3,2].twoSum());



// Array.prototype.myTranspose = function() {
//     let newArr = []
//     for (let i = 0; i < this.length; i++) {
//         let sub = []
//         for (let j = 0; j < this.length; j++) {
//             sub.push(this[j][i]);
//         } 
//         newArr.push(sub);
//     }
//     return newArr;
// }

// console.log([[1,2],[3,4]].myTranspose());