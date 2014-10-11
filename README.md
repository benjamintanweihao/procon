ProCon – Producer-Consumer problem modelled in Elixir
======

Me learning how to model the [Producer-Consumer](http://en.wikipedia.org/wiki/Producer%E2%80%93consumer_problem) problem in Elixir.

Part of the reason is to figure out how to limit the rate of the producer when the consumers cannot keep up.

## Running it

```
% iex -S mix
> ProCon.start(2, 5) # where 2 = # producers, 5 = # consumers
```

