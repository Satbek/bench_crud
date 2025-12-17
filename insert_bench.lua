local operations = require('bench_crud.operations')
require('bench_crud.setup')

local M = {}

local space_name, opts = "customers", {}

---@param b luabench.B
function M.bench_insert_raw(b)
    box.space[space_name]:truncate()
    for i = 1, b.N do
        operations.insert_raw(space_name, {i, 392, "John Fedor",100})
    end
end

---@param b luabench.B
function M.bench_insert_crud(b)
    box.space[space_name]:truncate()
    for i = 1, b.N do
        operations.insert_crud(space_name, {i, 392, "John Fedor",100}, opts)
    end
end


return M
