require('bench_crud.setup')
local operations = require('bench_crud.operations')

local M = {}

local space_name, tuple, opts = "customers", {45, 392, "John Fedor",100}, {}
local primary_key_empty = 100500
local primary_key = 42

---@param b luabench.B
function M.bench_get_raw_empty(b)
    operations.replace_raw(space_name, tuple)
    for _ = 1, b.N do
        operations.get_raw(space_name, primary_key_empty)
    end
end

---@param b luabench.B
function M.bench_get_crud_empty(b)
    operations.replace_raw(space_name, tuple)
    for _ = 1, b.N do
        operations.get_crud(space_name, primary_key_empty, opts)
    end
end

---@param b luabench.B
function M.bench_get_raw(b)
    operations.replace_raw(space_name, tuple)
    for _ = 1, b.N do
        operations.get_raw(space_name, primary_key)
    end
end

---@param b luabench.B
function M.bench_get_crud(b)
    operations.replace_raw(space_name, tuple)
    for _ = 1, b.N do
        operations.get_crud(space_name, primary_key, opts)
    end
end

return M
