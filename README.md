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

## How to add new testcase

### Step 1. Creat new folder for testcase.

Creat a new folder, the folder name should included jira ticket number if there
is corresponding ticket, and add give a meaningful name is also prefered,
if no ticket, just a short meaningful name is fine.

For example `EAD-265` is missing certain multi-lib configuration, so the
name folder name is `EAD-265-multi-lib`, the folder name also is the item
name in the report.

### Step 2. Create testcase.

Create a `Makefile` for the testcase, no much format restriction for that,
the only requirement is must have a default make rule (in general it's `all:`)
and `clean:`:

- Default make rule must run the testcase and return code is non zero if any error,
  otherwise return 0, and *DO NOT* use `riscv64-unknown-elf-gcc` as compiler directly,
  use `$(CC)` is prefered, and use `$(OBJDUMP)` rather than `riscv64-unknown-elf-objdump`.

- Clean rule must clean up all temporary file created during testing, and no
  error even not run test before clean, e.g. add `-f` option to `rm` to prevent
  no such file error.
