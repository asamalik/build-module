# Module builder

An easy way to **build modules for the [Fedora Modularity](https://fedoraproject.org/wiki/Modularity) project**.

This is an OCI container image with the [Module Build Service](https://pagure.io/fm-orchestrator) and all its dependencies installed - so you don't have to install everything on your system. The container needs to run with `--cap-add=SYS_ADMIN` so it can use chroot your machine to build the module in Mock.

It supports the latest (v1.0) [modulemd](https://pagure.io/modulemd) specification.

## Usage

```
$ ./build_module /module/git/repo /results/directory
```

Please use **absolute paths** and make sure that the name of your module repository and the modulemd file matches the name of your module.

### Example

Try this with an example module:

```
$ git clone https://github.com/asamalik/fake-proftpd-module-image proftpd
$ mkdir results
$ ./build_module $(pwd)/proftpd $(pwd)/results
```

### SELinux problem

If you got the following error:

```
2017-01-04 14:20:30,244 - module_build_service - WARNING - fatal: '//source/proftpd' does not appear to be a git repository
```

It's because my script and SELinux don't like each other. The strage thing is that you don't even get a notification from SELinux. In the meantime, before I (or someone) solve this issue, you need to use `setenforce 0` to workaround this issue. :( 

## Requirements

You need to have Docker running on your system. [Learn about Docker on Fedora](https://developer.fedoraproject.org/tools/docker/about.html).
