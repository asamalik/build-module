# Module builder

An easy way to build a module on any platform!

## Usage

```
$ ./build_module /local/module/git/repo/ /results/directory/
```

Paths must be absolute and the name of your module repository must match the name of your modulemd file.

### Example

Try this with an example module:

```
$ git clone https://github.com/asamalik/fake-proftpd-module-image proftpd
$ mkdir results
$ ./build_module $(pwd)/proftpd $(pwd)/results
```

## Requirements

You only need to have Docker running on your system.
