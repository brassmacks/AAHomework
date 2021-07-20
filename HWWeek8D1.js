function isPrime(number) {
    i = 2
    while (i < number - 1) {
        if (number % i == 0) { return false }
        i += 1
    }
    return true;
}


function sumOfNPrimes(n) {
    if (n === 0) { return 0 }
    start = 2
    count = 1
    sum = 2
    while (count < n) {
        start += 1;
        if (isPrime(start)) {
            count += 1;
            sum += start;
        }
    }
    return sum;
}
console.log(sumOfNPrimes(2))
console.log(sumOfNPrimes(3))
console.log(sumOfNPrimes(4))
console.log(sumOfNPrimes(5))
console.log(sumOfNPrimes(1))
console.log(sumOfNPrimes(0))
 function mysteryScoping1() {
... var x = 'out of block';
... if (true) {
..... var x = 'in block';
..... console.log(x);
..... }
... console.log(x);
... }
undefined
> function mysteryScoping2() {
... const x = 'out of block'
... ;
... if (true) {
..... const x = 'in block';
..... console.log(x);
..... }
... console.log(x);
... }
undefined
> function mysteryScoping3() {
... const x = 'out of block'
... ;
... if (true) {
..... var x = 'in block';
var x = 'in block';
                  ^

SyntaxError: Unexpected end of input

> 
> function mysteryScoping3() {
... const x = 'out of block';
... if (true) {
..... var x = 'in block';
var x = 'in block';
                  ^

SyntaxError: Unexpected end of input

> function mystryScoping3() {
... const x = 'out of block';
... if (true) {
..... let x = 'in block';
..... console.log(x);
..... }
... console.log(x);
... }
undefined
> function mysteryScoping4() {
... let x = 'out of block';
... if (true) {
..... let x = 'in block';
..... console.log(x);
..... }
... console.log(x);
... }
undefined
> function mysterScoping5() {
... let x = 'out of block';
... if (true) {
..... let x = 'in block';
..... console.log(x);
..... }
... let x = 'out of block again';
let x = 'out of block again';
                            ^

SyntaxError: Unexpected end of input

> mysterScoping4()
ReferenceError: mysterScoping4 is not defined
> mysteryScoping4()
in block
out of block
undefined
> mysteryScoping3()
ReferenceError: mysteryScoping3 is not defined
> mystryScoping3()
in block
out of block
undefined
> function madLib(word1, word2, word3) {
... console.log(`We shall ${word1} the ${word2} ${word3}`);
... }
undefined
> madLib("make", "best", "guac")
We shall make the best guac
undefined
> function isSubstring(searchString, subString) {
... return searchString.includes(subString);
... }
undefined
> isSubstring("time to program", "time")
true
> isSubstring("Jump for joy", "joys")
false
> function fizzBuzz(array) {
... array.forEach(num => 
..... if (num % 3 == 0 || num % 5 == 0) && !(num % 3 == 0 && num % 5 == 0) {
if (num % 3 == 0 || num % 5 == 0) && !(num % 3 == 0 && num % 5 == 0) {
^^

SyntaxError: Unexpected token if

> function fizzBuzz(array) {
... if ((num % 3 == 0 || num % 5 == 0) && !(num % 3 == 0 && num % 5 == 0)) {
..... console.log(num);
..... }
... }
undefined
> fizzBuzz([5,15,20,25,30,40,45])
ReferenceError: num is not defined
    at fizzBuzz (repl:2:1)
> function fizzBuzz(array) {
... array.forEach(num) {
array.forEach(num) {
                   ^

SyntaxError: Unexpected token {

> function fizzBuzz(array) {
... array.forEach(num => 
..... if ((num % 3 == 0 || num % 5 == 0) && !(num % 3 == 0 && num % 5 == 0)) {
if ((num % 3 == 0 || num % 5 == 0) && !(num % 3 == 0 && num % 5 == 0)) {
^^

SyntaxError: Unexpected token if

> function fizzBuzz(array) {
... array.forEach(function(num) {
..... if ((num % 3 == 0 || num % 5 == 0) && !(num % 3 == 0 && num % 5 == 0)) {
....... console.log(num);
....... }
..... }
..... }
}
^

SyntaxError: missing ) after argument list

> function fizzBuzz(array) {
... array.forEach(function(num) {
..... if ((num % 3 == 0 || num % 5 == 0) && !(num % 3 == 0 && num % 5 == 0)) {
....... console.log(num);
....... }
..... )
)
^

SyntaxError: Unexpected token )

> function fizzBuzz(array) {
... array.forEach(function(num) {
..... if ((num % 3 == 0 || num % 5 == 0) && !(num % 3 == 0 && num % 5 == 0)) {
....... console.log(num);
....... }
..... }
..... )
... }
undefined
> fizzBuzz([5,15,20,25,30,40,45])
5
20
25
40
undefined
> function isPrime(number) {
... i = 2
... while (i < number - 1) {
..... if (number % i == 0) { return false} }
... return true;
... }
undefined
> isPrime(2)
true
> isPrime(3)
true
> isPrime(4)
false
> isPrime(5)
^CError: Script execution interrupted.
    at Script.runInThisContext (vm.js:96:20)
    at REPLServer.defaultEval (repl.js:329:29)
    at bound (domain.js:396:14)
    at REPLServer.runBound [as eval] (domain.js:409:12)
    at REPLServer.onLine (repl.js:642:10)
    at REPLServer.emit (events.js:187:15)
    at REPLServer.EventEmitter.emit (domain.js:442:20)
    at REPLServer.Interface._onLine (readline.js:290:10)
    at REPLServer.Interface._line (readline.js:638:8)
    at REPLServer.Interface._ttyWrite (readline.js:919:14)
> function isPrime(number) {
... i = 2
... while (i < number - 1) {
..... if (number % i == 0) { return false} }
... i += 1;
... }
undefined
