Benchmark crud

benchmark:
```bash
git clone git@github.com:tarantool/crud.git
git clone git@github.com:Satbek/bench_crud.git

cd crud
ln -s ../bench_crud/ bench_crud

tt rocks --server https://moonlibs.org install luabench 0.3.0
./deps.sh
tt rocks make
```

cpu profile:
```bash
tarantool ./bench_crud/profile_crud_replace.lua
```