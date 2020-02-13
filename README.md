# Freedom-tool-test
This repo is testing for SiFive specific features on toolchain

## Usage
```
$ make CC=<path-to-your-riscv-compiler>
```

Example:
```
$ make
...
=========================Test Report=========================
        clic-interrupt-attribute ... PASS
                       cache-ops ... FAIL
                        clic-csr ... PASS
```
