#!/bin/bash

echo "0: $0"
echo "1: $1"
echo "count: $#"

if [ $# != 1 ]; then
    echo "must pass exactly one arg as file"
    exit;
fi

cd "$1";

grep -rl "float:\s*left" | xargs sed -i 's/float:\s*left/float: tfel/g' 
grep -rl "float:\s*right" | xargs sed -i 's/float:\s*right/float: left/g' 
grep -rl "float:\s*tfel" | xargs sed -i 's/float:\s*tfel/float: right/g' 

grep -rl "margin-right" | xargs sed -i 's/margin-right/margin-thgir/g' 
grep -rl "margin-left" | xargs sed -i 's/margin-left/margin-right/g' 
grep -rl "margin-thgir" | xargs sed -i 's/margin-thgir/margin-left/g' 

grep -rlE "^\s*margin:[[:space:]]*([^;\$[:space:]]+[[:space:]]+){3}[^;[:space:]\$]+\s*;" | xargs sed -i -E "s/^(\s*margin:[[:space:]]*)([^;\$[:space:]]+)[[:space:]]+([^;\$[:space:]]+)[[:space:]]+([^;\$[:space:]]+)[[:space:]]+([^;[:space:]\$]+)[[:space:]]*;/\1 \2 \5 \4 \3;/g"

grep -rl "padding-right" | xargs sed -i 's/padding-right/padding-thgir/g' 
grep -rl "padding-left" | xargs sed -i 's/padding-left/padding-right/g' 
grep -rl "padding-thgir" | xargs sed -i 's/padding-thgir/padding-left/g' 

grep -rlE "^\s*padding:[[:space:]]*([^;\$[:space:]]+[[:space:]]+){3}[^;[:space:]\$]+\s*;" | xargs sed -i -E "s/^(\s*padding:[[:space:]]*)([^;\$[:space:]]+)[[:space:]]+([^;\$[:space:]]+)[[:space:]]+([^;\$[:space:]]+)[[:space:]]+([^;[:space:]\$]+)[[:space:]]*;/\1 \2 \5 \4 \3;/g"

grep -rl "^\s*left:" | xargs sed -i -E "s/(^\s*)left:/\1tfel:/g"
grep -rl "^\s*right:" | xargs sed -i -E "s/(^\s*)right:/\1left:/g"
grep -rl "^\s*tfel:" | xargs sed -i -E "s/(^\s*)tfel:/\1right:/g"

grep -rl "text-align:\s*left" | xargs sed -i 's/text-align:\s*left/text-align: tfel/g' 
grep -rl "text-align:\s*right" | xargs sed -i 's/text-align:\s*right/text-align: left/g' 
grep -rl "text-align:\s*tfel" | xargs sed -i 's/text-align:\s*tfel/text-align: right/g' 

grep -rl "clear:\s*left" | xargs sed -i 's/clear:\s*left/clear: tfel/g' 
grep -rl "clear:\s*right" | xargs sed -i 's/clear:\s*right/clear: left/g' 
grep -rl "clear:\s*tfel" | xargs sed -i 's/clear:\s*tfel/clear: right/g' 




