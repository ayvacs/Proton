# Get Started

Welcome to the Proton tutorial area! In this section, you'll learn how to build beautiful user interfaces with Proton, even if you're using it for the first time, and even if this is your first time developing a game.

!!! warning "Pre-release"
	Proton is a work in progress, and it isn't fully released yet. Keep in mind that many features don't work yet, aren't fully implemented yet, or are about to be tweaked or overhauled. If you decide to use Proton for any major project, you'll have to take on the extra work of following these changes and updating your game accordingly.

## Here's what you need to know

All of these tutorials assume:

- that you're familiar with how UI works on Roblox;
	-  You don't have to be a UI designer - you just must be familiar with data types such as `Color3` and `UDim2`, events, and different types of UI instances.
- that you're familiar with the Luau scripting language;
	- Luau is the language used to code Roblox games; it's derived from Lua 5.1. If you're familiar with an earlier or later version of Lua, you'll find coding in Luau easy.
- and that you're comfortable with Roblox game development as a whole.

### Tutorial Groups

Tutorials are grouped together based on their difficulty:

- **The Basics** introduces you to Proton and its core ideas; creating instances, hooking events, etc.

These tutorials are designed to be followed in order, but feel free to skip to a specific page for a refresh.

### Terminology

- **Proton UI** refers to `ScreenGui` objects and any other instances created with the `Proton.new` function.

## Installing Proton

Proton is distributed as a `ModuleScript`. Pre-compiled downloads can be found on [the Proton release page](https://github.com/ayvacs/Proton/releases).

### ... into Roblox Studio

If you'll be scripting directly inside of Roblox Studio, here's how to install it:

1. First, download the [latest release](https://github.com/ayvacs/Proton/releases/latest) of Proton. Under the `Assets` menu, download the file named `Proton.rbxm`. This is the `ModuleScript` file that you will insert into Roblox Studio.
2. Insert it into Studio! Open Roblox Studio and drag the downloaded `.rbxm` file into the Studio window. A `ModuleScript` named `Proton` will be added to your game; ensure it is parented to `ReplicatedStorage`.
3. Ensure that there are no other instances parented to `ReplicatedStorage` with the name `Proton`.