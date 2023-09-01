# Import Proton

Import Proton to your script using `require()`, then import the `new` function with `Proton.require()`. You can use any name for the `Proton` and `new` variables if you wish.

!!! warning
    Please keep in mind that the built-in `require` function is different from the `Proton.require` function.

``` lua linenums="1"
local Proton = require(--[[Proton script location]])
local new = Proton.require("new")
```

## Setup

### Verbose Mode

Forces Proton to print extra debug information that is not necessary for normal use but may be required in certain scenarios, i.e. debugging. Verbose Mode can be enabled or disabled at any time. By default, it is disabled.

To enable Verbose Mode, insert this line in any script. (If you don't plan on disabling it later, we recommend putting it in `main.lua` any time after the `verbose` variable is defined.)

``` lua linenums="1"
Proton.verbose(true)
```

To disable it later, call this code:
``` lua linenums="1"
Proton.verbose(false)
```

To check for Verbose Mode, call this function:
``` lua linenums="1"
Proton.verboseEnabled()
```