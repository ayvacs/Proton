-- Proton UI library
-- https://ave.is-a.dev/Proton
-- Copyright (c) 2024 ayvacs.

-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:

-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.

local VERSION = "beta 0.0.1"


local Proton = {}


-- Print the information in white text
Proton.print = function(content: any): nil
    return print(("[Proton] %*"):format(tostring(content) or nil))
end

-- Print the information in a warning (orange text)
Proton.warn = function(content: any): nil
    return warn(("[Proton] %*"):format(tostring(content) or nil))
end

-- Print the information in an error (red text and end current thread)
Proton.error = function(content: any): nil
    return error(("[Proton] %*"):format(tostring(content) or nil))
end


-- Require the specified module
Proton.require = function(name: string): any
    local scr = script.functions:FindFirstChild(name)
    if (not scr) then return Proton.warn("Could not require module " .. name) end
    
    return require(scr)
end


Proton.print("Loaded Proton v" .. VERSION)
Proton.print("https://ave.is-a.dev/Proton")
return Proton