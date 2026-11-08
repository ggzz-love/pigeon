#!/usr/bin/env bash
set -e
exec "$IFAB_AFS_HOME/h3/envs/py311-20261105-v1/bin/python" -u - "$@" <<'H3_CLANG_RUN'
import pathlib,hashlib,subprocess,sys,tempfile,zipfile
p=pathlib.Path('h3_fl2va_direct_20261107.zip')
assert hashlib.sha256(p.read_bytes()).hexdigest()=='012ba31cb947a72fa3f7c37dbba5d5b426939d26965b28153379fe6ed20134d2'
d=pathlib.Path(tempfile.mkdtemp(prefix='h3-baseline-clang-'))
zipfile.ZipFile(p).extractall(d)
raise SystemExit(subprocess.call(['bash',str(d/'launch_crash_diagnosis.sh'),*sys.argv[1:]]))
H3_CLANG_RUN
