//: [Previous](@previous)

import Foundation
import Combine

/*:
# Scheduling operators - Dispatch to various threads
- Combine introduces the `Scheduler` protocol
- ... adopted by `DispatchQueue`, `RunLoop` and others
- ... lets you determine the execution context for subscription and value delivery
*/

//An object that controls access to a resource across multiple execution contexts through use of a traditional counting semaphore.
let firstStepDone = DispatchSemaphore(value: 0)

/*:
## `receive(on:)`
- determines on which scheduler values will be received by the next operator and then on
- used with a `DispatchQueue`, lets you control on which *queue* values are being delivered
*/
print("* Demonstrating receive(on:)")

let passThrough = PassthroughSubject<String, Never>()
let receivingQueue = DispatchQueue(label: "receiving-queue")
let subscription = passThrough
	.receive(on: receivingQueue)
	.sink { value in
		print("Received value: \(value) on thread \(Thread.current)")
		if value == "Four" {
			firstStepDone.signal()
		}
}

for string in ["One","Two","Three","Four"] {
	DispatchQueue.global().async {
        passThrough.send(string)
	}
}

print("~~~~~ Start ~~~~~")
firstStepDone.wait()
print("~~~~~ Done so the whole thing is not mixed ~~~~~")

/*:
## `subscribe(on:)`
- determines on which scheduler the subscription occurs
- useful to control on which scheduler the work _starts_
- may or may not impact the queue on which values are delivered
*/
print("\n* Demonstrating subscribe(on:)")
let subscription2 = [1,2,3,4,5].publisher
	.subscribe(on: DispatchQueue.global())
	.handleEvents(receiveOutput: { value in
		print("Value \(value) emitted on thread \(Thread.current)")
	})
	.receive(on: receivingQueue)
	.sink { value in
		print("Received value: \(value) on thread \(Thread.current)")
}

//: [Next](@next)
