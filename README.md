# Module builder

An easy way to **build modules for the [Fedora Modularity](https://fedoraproject.org/wiki/Modularity) project**.

This is an OCI container image with the [Module Build Service](https://pagure.io/fm-orchestrator) and all its dependencies installed - so you don't have to install everything on your system. The container needs to run with `--cap-add=SYS_ADMIN` so it can use chroot your machine to build the module in Mock.

It supports the latest (v1.0) [modulemd](https://pagure.io/modulemd) specification.

## Usage

```
$ ./build_module /module/git/repo /results/directory
```

Please make sure that the name of your module repository and the modulemd file matches the name of your module.

### Example

Try this with an example module:

```
$ git clone https://github.com/asamalik/fake-proftpd-module-image proftpd
$ ./build_module ./proftpd ./results
```

### SELinux notes

If SELinux is enabled, the script instructs docker to (re)label the two bind-mounted directories in order that they are accessible from within the container. Take extra care not to specify directories you don't want relabeled here.

## Requirements

You need to have Docker running on your system. [Learn about Docker on Fedora](https://developer.fedoraproject.org/tools/docker/about.html).
