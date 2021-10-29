# Runtime

## Execution

## Step Execution

## Serialization

## Async Services

The Processable runtime will run service tasks synchronously when the step is executed. This behavior can be bypassed causing the automated task to go directly to `waiting`. Note: the runtime will expect the task to be run manually and invoked with the result when complete.

```ruby
# Initialize the runtime to `wait` on service tasks, this will require the service task to be manually `invoked` when the work is complete.
runtime = Processable::Runtime.new(async_services: true)
```