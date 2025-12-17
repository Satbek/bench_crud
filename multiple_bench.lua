require('bench_crud.setup')
local operations = require('bench_crud.operations')

local M = {}

local space_name, tuple, opts = "customers", {45, 392, "John Fedor",100}, {}
local ops = {{'+', 4, 1}}
local primary_key = 45

---@param b luabench.B
function M.bench_multiple_crud(b)
    box.space[space_name]:truncate()
    for _ = 1, b.N do
        operations.replace_crud(space_name, tuple, opts)
        operations.upsert_crud(space_name, tuple, ops, opts)
        operations.delete_crud(space_name, primary_key, opts)
    end
end

return M
