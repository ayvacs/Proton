# Import Proton

Import Proton to your script using `require()`, then import the `new` function with `Proton.require()`. You can use any name for the `Proton` and `new` variables if you wish.

!!! warning
    Please keep in mind that Lua's built-in `require` function is different from the `Proton.require` function.

``` lua linenums="1"
local Proton = require(--[[Proton script location]])
local new = Proton.require("new")
```

## Setup

### Verbose Mode

Forces Proton to print extra debug information that is not necessary for normal use but may be required in certain debugging scenarios. Verbose Mode can be enabled or disabled at any time. By default, it is disabled.

To enable Verbose Mode, insert this line in any script.

``` lua linenums="1"
Proton.verbose(true)
```

Alternatively, you can set `local verbose = true` in `main.lua`. This is recommended if you don't want to disable it later.

Likewise, if you want to disable Verbose Mode later, call this code:

``` lua linenums="1"
Proton.verbose(false)
```

To check for Verbose Mode, call this function:

``` lua linenums="1"
Proton.verboseEnabled()
```