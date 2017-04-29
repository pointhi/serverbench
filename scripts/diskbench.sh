#!/bin/sh

# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>

PWD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

SSD_FIO="${PWD_DIR}/ssd.fio"
LC_ALL=C

echo "$ date"
date

echo ""
echo "$ fio \"${SSD_FIO}\""
fio "${SSD_FIO}"

echo ""
echo "$ sysbench --test=fileio --file-total-size=6G prepare"
sysbench --test=fileio --file-total-size=6G prepare

echo ""
echo "$ sysbench --test=fileio --file-total-size=6G --file-test-mode=rndrw  --max-time=300 --max-requests=0 --file-extra-flags=direct run"
sysbench --test=fileio --file-total-size=6G --file-test-mode=rndrw --max-time=300 --file-extra-flags=direct --max-requests=0 run

echo ""
echo "$ sysbench --test=fileio --file-total-size=6G --file-test-mode=rndrw --max-time=300 --file-fsync-all --max-requests=0 --num-threads=8 run"
sysbench --test=fileio --file-total-size=6G --file-test-mode=rndrw --max-time=300 --file-fsync-all --max-requests=0 --num-threads=8 run

echo ""
echo "$ sysbench --test=fileio --file-total-size=6G --file-test-mode=rndrw --max-time=300 --file-fsync-all --max-requests=0 --num-threads=64 run"
sysbench --test=fileio --file-total-size=6G --file-test-mode=rndrw --max-time=300 --file-fsync-all --max-requests=0 --num-threads=64 run

echo ""
echo "$ sysbench --test=fileio --file-total-size=6G cleanup"
sysbench --test=fileio --file-total-size=6G cleanup

