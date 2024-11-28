-- Test file for LSP functionality
local function test_function(param)
    -- This should show type information on hover
    local result = param + 1
    return result
end

-- This should show a diagnostic about unused variable
local unused_var = 42

test_function("string") -- This should show a diagnostic about wrong parameter type
