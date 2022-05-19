# OR1200 Bugs

Requires: https://github.com/YosysHQ/oss-cad-suite-build

In order to reproduce the bugs 20 and 24,
go to the `formal` folder and run `sby cover.sb`.
To see what happens without zero initialization, run
`sby check_no_zero_init.sby`.
