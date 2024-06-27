# Proton Special Properties

Proton's "special properties" allow you to easily expand the functionality of your Proton Instances when creating them.

For instance, the `Child` and `Children` special properties allow you to easily parent new or existing Instances.

``` lua linenums="1"
local txtBtn = new "TextButton" {}

new "ScreenGui" {
    ["Name"] = "My UI",
    ["Children"] = {
        txtBtn,
        new("Frame"){}
    },
    ["Child"] = new "TextLabel" {}
}
```