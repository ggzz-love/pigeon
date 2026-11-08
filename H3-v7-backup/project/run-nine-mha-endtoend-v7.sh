#!/usr/bin/env bash
set -e
export H3_NINE_ORIGINAL_AOT_SHA256=7028755b034befd3f3a9c00d02931cc555f50730d0594de572b3edcd629494ca
exec "$IFAB_AFS_HOME/h3/envs/py311-20261105-v1/bin/python" -u - <<'H3_CLANG_RUN'
import pathlib,hashlib,subprocess,sys,tempfile,zipfile
p=pathlib.Path('h3_nine_mha_endtoend_v7_20261107.zip')
assert hashlib.sha256(p.read_bytes()).hexdigest()=='95e7cea945fff61a5b87a1f0d217a95fd012bd124fbade97386f862e48a840cd'
d=pathlib.Path(tempfile.mkdtemp(prefix='h3-baseline-clang-'))
zipfile.ZipFile(p).extractall(d)
raise SystemExit(subprocess.call(['bash',str(d/'launch_crash_diagnosis.sh')]))
H3_CLANG_RUN
