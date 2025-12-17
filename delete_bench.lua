require('bench_crud.setup')
local operations = require('bench_crud.operations')

local M = {}

local space_name, primary_key, opts = 'customers', 42, {}

---@param b luabench.B
function M.bench_delete_raw(b)
    for _ = 1, b.N do
        operations.delete_raw(space_name, primary_key)
    end
end

---@param b luabench.B
function M.bench_delete_crud(b)
    for _ = 1, b.N do
        operations.delete_crud(space_name, primary_key, opts)
    end
end

return M
