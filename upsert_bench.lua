require('bench_crud.setup')
local operations = require('bench_crud.operations')

local M = {}

local space_name, tuple, opts = "customers", {45, 392, "John Fedor",100}, {}
local ops = {{'+', 4, 1}}

---@param b luabench.B
function M.bench_upsert_raw(b)
    box.space[space_name]:truncate()
    operations.replace_crud(space_name, tuple)
    for _ = 1, b.N do
        operations.upsert_raw(space_name, tuple, ops)
    end
end

---@param b luabench.B
function M.bench_upsert_crud(b)
    box.space[space_name]:truncate()
    operations.replace_crud(space_name, tuple)
    for _ = 1, b.N do
        operations.upsert_crud(space_name, tuple, ops, opts)
    end
end

return M
