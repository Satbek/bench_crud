local call = require('crud.common.call')

local function replace_raw(space_name, tuple)
    box.space[space_name]:replace(tuple)
end

local function replace_crud(space, tuple, opts)
    call.storage_api.call_on_storage('guest', '_crud.replace_on_storage', space, tuple, opts)
end

local function get_raw(space_name, key)
    box.space[space_name]:get(key)
end

local function get_crud(space, key, opts)
    call.storage_api.call_on_storage('guest', '_crud.get_on_storage', space, key, opts)
end

local function delete_raw(space_name, key)
    box.space[space_name]:delete(key)
end

local function delete_crud(space, key, opts)
    call.storage_api.call_on_storage('guest', '_crud.delete_on_storage', space, key, opts)
end

local function insert_raw(space_name, tuple)
    box.space[space_name]:insert(tuple)
end

local function insert_crud(space, tuple, opts)
    call.storage_api.call_on_storage('guest', '_crud.insert_on_storage', space, tuple, opts)
end

local function update_raw(space_name, key, operations)
    box.space[space_name]:update(key, operations)
end

local function update_crud(space, key, operations, opts)
    call.storage_api.call_on_storage('guest', '_crud.update_on_storage', space, key, operations, opts)
end

local function upsert_raw(space_name, tuple, operations)
    box.space[space_name]:upsert(tuple, operations)
end

local function upsert_crud(space, tuple, operations, opts)
    call.storage_api.call_on_storage('guest', '_crud.upsert_on_storage', space, tuple, operations, opts)
end

return {
    replace_raw = replace_raw,
    replace_crud = replace_crud,
    get_raw = get_raw,
    get_crud = get_crud,
    delete_raw = delete_raw,
    delete_crud = delete_crud,
    insert_raw = insert_raw,
    insert_crud = insert_crud,
    update_raw = update_raw,
    update_crud = update_crud,
    upsert_raw = upsert_raw,
    upsert_crud = upsert_crud,
}
