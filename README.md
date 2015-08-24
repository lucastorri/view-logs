# view-logs

Learning more about [crystal-lang](http://crystal-lang.org/). This project will serve text files (in my case, log files) that follow the following directory structure

```
all-logs
├── log-group-1
│   ├── log1.log
│   ├── log2.log
│   └── ...
```

## Build

```
cd $project_dir
crystal deps
crystal build src/view-logs.cr
```

## Usage

Build and run `./view-logs $path/all-logs`
