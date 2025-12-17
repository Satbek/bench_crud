require('bench_crud.setup')
local operations = require('bench_crud.operations')

local M = {}

local space_name, tuple, opts = "customers", {45, 392, "John Fedor",100}, {}

---@param b luabench.B
function M.bench_replace_raw(b)
    box.space[space_name]:truncate()
    for _ = 1, b.N do
        operations.replace_raw(space_name, tuple)
    end
end

---@param b luabench.B
function M.bench_replace_crud(b)
    box.space[space_name]:truncate()
    for _ = 1, b.N do
        operations.replace_crud(space_name, tuple, opts)
    end
end

return M
