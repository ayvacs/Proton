# Compile Proton

Download a precompiled build <a href="https://github.com/ayvacs/Proton/releases" target="_blank">here</a> or build one yourself.

## Use a precompiled build

Download a precompiled build <a href="https://github.com/ayvacs/Proton/releases" target="_blank">here</a>. You only need to download the `.rbxm` file; import this into Studio by dragging and dropping the file onto the Studio window.

A ModuleScript named `Proton` will be imported. You can parent it anywhere, but we suggest `ReplicatedStorage`.

## Build it yourself

* Create a ModuleScript named `Proton`. Parent it anywhere, we suggest `ReplicatedStorage`
* Paste in the contents of `main.lua`
* Create a folder named `functions`; parent it to the ModuleScript
* For each file in the `src/functions` directory of Proton's source code, create a new ModuleScript in the `functions` folder and paste in the contents of the file. Rename the ModuleScript to the file's name, omitting the file extension.
* Done