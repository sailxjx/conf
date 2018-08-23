

```javascript
function testFinally () {
    try {
        console.log(1)
        return 1
    } catch (err) {
        console.log(2)
        return 2
    } finally {
        console.log(3)
        return 3
    }
    return "Do not reach"
}

console.log(testFianlly())
```


    evalmachine.<anonymous>:15

    console.log(testFinally())

                ^

    ReferenceError: testFinally is not defined

        at evalmachine.<anonymous>:15:13

        at Object.exports.runInThisContext (vm.js:54:17)

        at run ([eval]:606:19)

        at onRunRequest ([eval]:377:22)

        at onMessage ([eval]:345:17)

        at emitTwo (events.js:106:13)

        at process.emit (events.js:191:7)

        at process.nextTick (internal/child_process.js:719:12)

        at _combinedTickCallback (internal/process/next_tick.js:67:7)

        at process._tickCallback (internal/process/next_tick.js:98:9)

