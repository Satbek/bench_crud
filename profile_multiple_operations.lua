require('bench_crud.setup')
local operations = require('bench_crud.operations')

local PROFILE_NAME = 'sysprof_crud_multiple'

local space_name, tuple, opts = "customers", {45, 392, "John Fedor",100}, {}
local ops = {{'+', 4, 1}}
local primary_key = 45

require('fiber').set_max_slice({warn = 30, err = 60})

--- heat
for _ = 1, 1000 do
    operations.replace_crud(space_name, tuple, opts)
end

assert(box.space.customers:len() == 1)


local res, err = misc.sysprof.start({mode = 'C', interval = 10, path = PROFILE_NAME})
assert(res, err)

for _ = 1,10000000 do
    operations.replace_crud(space_name, tuple, opts)
    operations.upsert_crud(space_name, tuple, ops, opts)
    operations.delete_crud(space_name, primary_key, opts)
end

res, err = misc.sysprof.stop()
assert(res, err)

print(require('json').encode(misc.sysprof.report()))

os.execute(([[tarantool -e 'require("sysprof")(arg)' - %s > tmp]]):format(PROFILE_NAME))
os.execute(([[bash -lc 'branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo detached); branch=${branch//[^A-Za-z0-9_.-]/_}; perl bench_crud/flamegraph.pl tmp > "%s_${branch}.svg"' ]]):format(PROFILE_NAME))
os.exit()
